class Diary
  attr_reader :entries

  def initialize
    @entries = Array.new
  end

  def add(entry:, title:)
    @entries << { :entry => entry, :title => title }
  end

  def list_titles
    entries.map { |entry| entry[:title] }
  end

  def get_entry_by(title:)
    entries.each { |entry| return entry[:entry] if entry[:title] == title }
  end
end
