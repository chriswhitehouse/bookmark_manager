require "pg"

class DatabaseConnection
  def self.setup(database_name)
    @connection = PG.connect dbname: database_name
  end

  def self.query(sql_string)
    @connection.exec(sql_string)
  end
end
