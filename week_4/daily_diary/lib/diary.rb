require 'pg'

class Diary
  # attr_reader :entries
  #
  # def initialize
  #   @entries = Array.new
  # end

  # def add(entry:, title:)
  #   @entries << { :entry => entry, :title => title }
  # end

  def self.add(title:, entry:)
    connection.exec("INSERT INTO diary (title, entry) VALUES('#{title}', '#{entry}')")
  end

  # def list_titles
  #   entries.map { |entry| entry[:title] }
  # end

  def self.list_titles
    entries.map { |entry| entry['title'] }
  end

  # def get_entry_by(title:)
  #   entries.each { |entry| return entry[:entry] if entry[:title] == title }
  # end

  def self.get_entry_by(title:)
    entries.each { |entry| return entry['entry'] if entry['title'] == title }
  end

  def self.entries
    connection.exec("SELECT * FROM diary")
  end

  private
  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? db = 'daily_diary_test' : db = 'daily_diary'
    PG.connect(dbname: db)
  end
end
