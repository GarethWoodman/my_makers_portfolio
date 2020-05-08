require 'pg'

class Diary
  def self.add(title:, entry:)
    Entry.create(title)
  end

  def self.find_entry_by(id:)
    entries.each { |entry| return entry['entry'] if entry['id'] == id }
  end

  def self.entries
    Entry.all
  end
end

class Entry
  attr_reader: id, title, entry, url

  def initialize(id:, title:, entry:)
    @id     = id
    @entry  = entry
    @title  = tile
    @url    = "http://localhost:9292/entries/#{id}"
  end

  def self.create(url:, title:)
    result = connection.exec("INSERT INTO diary (title, entry) VALUES('#{title}', '#{entry}') RETURNING id, title, url;")
    Entry.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['entry'])
  end

  def self.all
    entries.each { |entry| Entry.new(id: entry['id'], title: entry['title'], entry:['entry']) }
  end

  # Private Methods - - - - - - - - - - - - -

  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? db = 'daily_diary_test' : db = 'daily_diary'
    PG.connect(dbname: db)
  end

  def self.entries
    connection.exec("SELECT * FROM diary")
  end

  private_class_method :connection, :entries
end
