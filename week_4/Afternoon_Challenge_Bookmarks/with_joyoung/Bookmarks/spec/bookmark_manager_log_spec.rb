require 'spec_helper'
require './lib/bookmark_manager_log'

describe BookmarkManagerLog do
  it "returns a list of bookmarks" do
    expect(subject).to respond_to(:bookmark_list)
  end
end

# bookmark = double("Bookmark")
# @bookmark_manager = BookmarkManager.new(bookmark)
# expect(@bookmark_manager.bookmark_list).to eq true
