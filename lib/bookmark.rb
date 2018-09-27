require "pg"

class Bookmark


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test', :user => 'robbiecampbell')
    else
      connection = PG.connect(dbname: 'bookmark_manager', :user => 'robbiecampbell')
    end

    all_bookmarks = connection.exec "SELECT * FROM bookmarks"

    all_bookmarks.map { |row| row['url'] }
  end

  def self.add(url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test', :user => 'robbiecampbell')
    else
      connection = PG.connect(dbname: 'bookmark_manager', :user => 'robbiecampbell')
    end
      new_bookmark = connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")

  end


end

# [
#   "http://www.makersacademy.com",
#   "http://www.destroyallsoftware.com",
#   "http://www.google.com"
# ]
