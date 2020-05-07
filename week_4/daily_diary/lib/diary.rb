class Diary
  attr_reader :entries

  def initialize
    @entries = Array.new
  end

  def add(entry:)
    @entries << entry
  end
end
