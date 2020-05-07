require 'diary'

describe Diary do

  # Add entries to diary BEFORE each unit test
  let(:titles)   { ["First entry", "Second entry", "Third entry"] }

  before :each do
    subject.add(entry: "Today is ok",   title: titles[0])
    subject.add(entry: "Today is meh",  title: titles[1])
    subject.add(entry: "Today is bad",  title: titles[2])
  end
  # ----------------------------------------------------------------

  describe '#add(entry:)' do
    it 'returns entry' do
      expect(subject.entries.first[:entry]).to eq "Today is ok"
    end

    it 'returns title' do
      expect(subject.entries.first[:title]).to eq "First entry"
    end
  end

  describe '#list_titles' do
    it 'returns all entry titles' do
      expect(subject.list_titles).to eq titles
    end
  end

  describe '#get_entry_by(title:)' do
    it 'returns entry by title' do
      expect(subject.get_entry_by(title: titles[0])).to eq "Today is ok"
    end
  end
end
