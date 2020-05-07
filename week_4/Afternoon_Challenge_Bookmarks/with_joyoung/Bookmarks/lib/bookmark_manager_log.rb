require './lib/bookmark'

class BookmarkManagerLog
  #attr_reader :bookmark_list

  def initialize(bookmark = Bookmark.new("Gareth", "First note"))
    @bookmark_list = []
    @bookmark_list << bookmark
  end

  def bookmark_list
    @bookmark_list
  end
end
