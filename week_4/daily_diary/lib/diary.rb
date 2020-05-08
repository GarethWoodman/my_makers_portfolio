require 'pg'

class Diary
  def self.add_entry(title:, entry:)
    Entry.create(title, entry)
  end

  def self.find_entry(id:)
    entries.each { |entry| return entry if entry.id == id }
  end

  def self.entries
    Entry.all
  end
end

class Entry
  attr_reader :id, :title, :entry, :url

  def initialize(id:, title:, entry:)
    @id     = id
    @entry  = entry
    @title  = title
    @url    = "http://localhost:9292/entries/#{id}"
  end

  def self.create(title, entry)
    result = connection.exec("INSERT INTO diary (title, entry) VALUES('#{title}', '#{entry}') RETURNING id, title, entry;")
    Entry.new(id: result[0]['id'], title: result[0]['title'], entry: result[0]['entry'])
  end

  def self.all
    entries = connection.exec("SELECT * FROM diary")
    entries.map { |entry| Entry.new(id: entry['id'], title: entry['title'], entry: entry['entry']) }
  end

  # Private Methods - - - - - - - - - - - - -

  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? db = 'daily_diary_test' : db = 'daily_diary'
    PG.connect(dbname: db)
  end

  private_class_method :connection
end
