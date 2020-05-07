require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    bookmarks.map do |bookmark|
      Bookmark.new(id: bookmark['id'],
                   title: bookmark['title'],
                   url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    result = connection.exec("INSERT INTO bookmarks (url, title)
                              VALUES('#{url}', '#{title}')
                              RETURNING id, title, url;")

    Bookmark.new(id: result[0]['id'],
                 title: result[0]['title'],
                 url: result[0]['url'])
  end

  def self.delete(id:)
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    result = connection.exec("UPDATE bookmarks
                              SET url = '#{url}', title = '#{title}'
                              WHERE id = '#{id}'
                              RETURNING id, title, url;")

    Bookmark.new(id: result[0]['id'],
                 title: result[0]['title'],
                 url: result[0]['url'])
  end

  # Private Class methods ----------------
  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? db = 'bookmark_manager_test' :
                                   db = 'bookmark_manager'
    PG.connect :dbname => db
  end

  def self.bookmarks
    connection.exec("SELECT * FROM bookmarks")
  end

  private_class_method :connection, :bookmarks
end
