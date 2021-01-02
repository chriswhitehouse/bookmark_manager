describe DatabaseConnection do
  describe ".setup" do
    it "should respond to .setup with 1 arguement" do
      expect(described_class).to respond_to(:setup).with(1).argument
    end

    it "should set up a connection to a database through PG" do
      expect(PG).to receive(:connect).with(dbname: "bookmark_manager_test")
      described_class.setup("bookmark_manager_test")
    end
  end

  describe ".query" do
    it "should respond to .query with 1 arguement" do
      expect(described_class).to respond_to(:query).with(1).argument
    end

    it "should execute the sql string via PG" do
      connection = described_class.setup("bookmark_manager_test")

      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
