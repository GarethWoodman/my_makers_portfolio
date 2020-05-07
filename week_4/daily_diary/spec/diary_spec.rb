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

  describe '#find_entry_by(id:)' do
    let(:entry) { Diary.entries.first }

    it 'returns entry by id' do
      expect(Diary.find_entry_by(id: entry['id'])).to eq Diary.entries.first['entry']
    end
  end
end
