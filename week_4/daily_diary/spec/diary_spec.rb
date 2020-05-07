require 'diary'

describe Diary do
  describe '#add(entry:)' do
    it 'adds a new entry' do
      subject.add(entry: "First entry")
      expect(subject.entries.first).to eq "First entry"
    end
  end
end
