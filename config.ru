require "rubygems"
require File.join(File.dirname(__FILE__), "app.rb")
require File.dirname(__FILE__) + "/lib/bookmark.rb"
require File.dirname(__FILE__) + "/lib/comment.rb"
require File.dirname(__FILE__) + "/lib/database_connection.rb"

use Rack::MethodOverride

run BookmarkManager
