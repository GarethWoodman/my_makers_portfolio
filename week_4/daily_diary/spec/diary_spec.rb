require 'diary'

describe Diary do

  # Add entries to diary BEFORE each unit test
  let(:titles)   { ["First entry", "Second entry", "Third entry"] }

  before :each do
    Diary.add_entry(title: titles[0], entry: "Today is ok")
    Diary.add_entry(title: titles[1], entry: "Today is meh")
    Diary.add_entry(title: titles[2], entry: "Today is bad")
  end
  # ----------------------------------------------------------------

  describe '#add_entry(title:, entry:)' do
    it 'returns entry' do
      expect(Diary.entries.first.entry).to eq "Today is ok"
    end

    it 'returns title' do
      expect(Diary.entries.first.title).to eq "First entry"
    end
  end

  describe '#find_entry(id:)' do
    let(:entry) { Diary.entries.first }
    let(:entry_title) {entry.title}

    it 'returns entry by id' do
      expect(Diary.find_entry(id: entry.id).title).to eq entry.title
    end
  end
end
