class SecretDiary
  attr_reader :diary

  def initialize
    @entries = []
    @diary = Diary.new
  end

  def add_entry(entry = "Random entry")
    return if @diary.is_locked?
    @entries << entry
    "Added entry"
  end

  def get_entries
    return if @diary.is_locked?
    @entries
  end
end

class Diary
  def intialize
    @locked = true
  end

  def unlock
    @locked = false
  end

  def lock
    return if is_locked?
    @locked = true
  end

  def is_locked?
    raise "Diary is locked" if @locked
  end
end
