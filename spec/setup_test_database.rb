require 'pg'

def setup_test_database
  p "Setting up test database..."
  con = PG.connect :dbname => 'bookmark_manager_test', :user => 'robbiecampbell'
  con.exec("TRUNCATE bookmarks;")
end
