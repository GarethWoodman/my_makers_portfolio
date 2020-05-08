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
  attr_reader :id, :title, :content, :url

  def initialize(id:, title:, entry:)
    @id       = id
    @content  = entry
    @title    = title
    @url      = "http://localhost:9292/entries/#{id}"
  end

  def update(title:, entry:)
    connection.exec("UPDATE diary SET title = '#{title}', entry = '#{entry}' WHERE id = '#{@id}' RETURNING id, title, entry;")
    @content  = entry
    @title    = title
  end

  def delete()
    connection.exec("DELETE FROM diary WHERE id = #{@id}")
  end

  def self.create(title, entry)
    result = connection.exec("INSERT INTO diary (title, entry) VALUES('#{title}', '#{entry}') RETURNING id, title, entry;")
    instance(result[0])
  end

  def self.all
    entries = connection.exec("SELECT * FROM diary")
    entries.map { |entry| instance(entry) }
  end

  # Private Methods - - - - - - - - - - - - -
  private
  def connection
    ENV['ENVIRONMENT'] == 'test' ? db = 'daily_diary_test' : db = 'daily_diary'
    PG.connect(dbname: db)
  end

  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? db = 'daily_diary_test' : db = 'daily_diary'
    PG.connect(dbname: db)
  end

  def self.instance(entry)
    Entry.new(id: entry['id'], title: entry['title'], entry: entry['entry'])
  end

  private_class_method :connection
end
