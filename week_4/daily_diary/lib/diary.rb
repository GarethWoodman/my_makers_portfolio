require 'pg'

class Diary
  def self.add(title:, entry:)
    connection.exec("INSERT INTO diary (title, entry) VALUES('#{title}', '#{entry}')")
  end

  def self.entries
    connection.exec("SELECT * FROM diary")
  end

  def self.find_entry_by(id:)
    entries.each { |entry| return entry['entry'] if entry['id'] == id }
  end

  private
  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? db = 'daily_diary_test' : db = 'daily_diary'
    PG.connect(dbname: db)
  end
end
