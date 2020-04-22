require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  shared_context "set diary" do
    let(:subject) do
    #prepare diary for all tests
    diary = double("diary", :read => "Message")
    diary.stub(:write).with("Message")
    subject = SecretDiary.new(diary)
    end
  end

  context "when locked" do
    include_context "set diary"

    before(:each) do
      #locks diary
      subject.lock
    end

    it "refuses to be read" do
      expect(subject.read).to eq ("Go away!")
    end

    it "refuses to be written" do
      expect(subject.write("Message")).to eq ("Go away!")
    end
  end

  context "when unlocked" do
    include_context "set diary"

    before(:each) do
      #locks diary
      subject.unlock
    end

    it "gets read" do
      expect(subject.read).to eq("Message")
    end

    it "gets written" do
      expect(subject.write("Message")).to eq(nil)
    end
  end
end
