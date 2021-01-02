require "pg"

def setup_test_database
  connection = PG.connect(dbname: "bookmark_manager_test")

  # Clear the tables
  connection.exec("TRUNCATE bookmarks, comments, tags, bookmarks_tags;")
end
