require 'pg'

class Bookmark
  def self.all
    create_db_connection

    result = @connection.exec "SELECT * FROM bookmarks"
    result.map { |bookmark| {bookmark['title'] => bookmark['url']} }
  end

  def self.create(title, url)
    create_db_connection

    result = @connection.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}')"
  end

  private

  def self.create_db_connection
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      @connection = PG.connect :dbname => 'bookmark_manager'
    end
  end
end
