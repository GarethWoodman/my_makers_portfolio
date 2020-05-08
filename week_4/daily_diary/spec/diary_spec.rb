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

  describe '.add_entry(title:, entry:)' do
    it 'returns entry' do
      expect(Diary.entries.first.content).to eq "Today is ok"
    end

    it 'returns title' do
      expect(Diary.entries.first.title).to eq "First entry"
    end
  end

  describe '.find_entry(id:)' do
    let(:entry) { Diary.entries.first }

    it 'returns entry by id' do
      expect(Diary.find_entry(id: entry.id).content).to eq entry.content
    end
  end

  describe '#update(title:, entry:)' do
    let(:first_entry) {Diary.entries.first}

    before :each do
      first_entry.update(title: "Still First entry", entry: "Today is AMAZING!")
    end

    it 'updates entry' do
      expect(first_entry.title).to eq "Still First entry"
    end
  end

  describe '#delete' do
    it 'deletes an entry' do
      expect { Diary.entries.first.delete }.to change { Diary.entries.length }.by(-1)
    end
  end
end
