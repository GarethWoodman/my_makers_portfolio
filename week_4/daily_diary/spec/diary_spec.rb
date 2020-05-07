require 'diary'

describe Diary do

  # Add entries to diary BEFORE each unit test
  let(:titles)   { ["First entry", "Second entry", "Third entry"] }

  before :each do
    Diary.add(title: titles[0], entry: "Today is ok")
    Diary.add(title: titles[1], entry: "Today is meh")
    Diary.add(title: titles[2], entry: "Today is bad")
  end
  # ----------------------------------------------------------------

  describe '#add(title:, entry:)' do
    it 'returns entry' do
      expect(Diary.entries.first['entry']).to eq "Today is ok"
    end

    it 'returns title' do
      expect(Diary.entries.first['title']).to eq "First entry"
    end
  end

  describe '#list_titles' do
    it 'returns all entry titles' do
      expect(Diary.list_titles).to eq titles
    end
  end

  describe '#get_entry_by(title:)' do
    it 'returns entry by title' do
      expect(Diary.get_entry_by(title: titles[0])).to eq "Today is ok"
    end
  end
end
