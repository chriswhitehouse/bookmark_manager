require "database_helpers"

describe Bookmark do
  describe ".all" do
    it "returns a list of all saved bookmarks" do
      # Add the test data
      bookmark = Bookmark.create(title: "Makers Academy", url: "http://www.makersacademy.com")
      Bookmark.create(title: "DAS", url: "http://www.destroyallsoftware.com")
      Bookmark.create(title: "Google", url: "http://www.google.com")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Makers Academy"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe ".create" do
    it "should add a bookmark to list of saved bookmarks" do
      bookmark = Bookmark.create(title: "Test Bookmark", url: "http://www.testbookmark.com")
      persisted_data = persisted_data(table: 'bookmarks', id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first["id"]
      expect(bookmark.title).to eq "Test Bookmark"
      expect(bookmark.url).to eq "http://www.testbookmark.com"
    end

    it "should not create a boomark if the URL is not valid" do
      Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(Bookmark.all).to be_empty
    end
  end

  describe ".delete" do
    it "should delete a bookmark from the list" do
      bookmark = Bookmark.create(title: "first_test", url: "http://www.first_test.com")

      # persisted_data = persisted_data(id: bookmark.id)
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe ".update" do
    it "should update the bookmark with new url or title" do
      bookmark = Bookmark.create(title: "first_test", url: "http://www.first_test.com")
      updated_bookmark = Bookmark.update(id: bookmark.id, title: "second_test", url: "http://www.second_test.com")

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq "second_test"
      expect(updated_bookmark.url).to eq "http://www.second_test.com"
    end
  end

  describe ".find" do
    it "it returns the requested bookmark object" do
      bookmark = Bookmark.create(title: "first_test", url: "http://www.first_test.com")

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq "first_test"
      expect(result.url).to eq "http://www.first_test.com"
    end
  end

  describe "#comments" do
    let(:comment_class) { double(:comment_class) }

    it 'returns a list of comments on the bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class)
    end
  end
end
