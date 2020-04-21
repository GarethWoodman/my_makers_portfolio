require './lib/secret_diary'

describe SecretDiary do
  is_locked = "Diary is locked"

  describe "throws error if locked and" do
    it "adding an entry" do
      subject.diary.lock
      expect { subject.add_entry }.to raise_error(is_locked)
    end

    it "getting entries" do
      subject.diary.lock
      expect { subject.get_entries }.to raise_error(is_locked)
    end

    it "trying to lock again" do
      subject.diary.lock
      expect { subject.diary.lock }.to raise_error(is_locked)
    end
  end

  describe "if unlocked allows user to" do
    it "add an entry" do
      subject.diary.unlock
      expect { subject.add_entry }.to_not raise_error(is_locked)
    end

    it "get entries" do
      subject.diary.unlock
      expect { subject.get_entries }.to_not raise_error(is_locked)
    end
  end

  it "confirms added entry" do
    subject.diary.unlock
    expect(subject.add_entry).to eq("Added entry")
  end

  it "gets entries" do
    subject.diary.unlock
    subject.add_entry
    expect(subject.get_entries.count).to eq(1)
  end
end
