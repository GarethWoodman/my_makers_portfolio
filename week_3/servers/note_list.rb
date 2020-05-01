class NoteList
  def initialize
    @notes = []
  end

  def add(note)
    @notes << note
  end

  def print
    @notes
  end
end
