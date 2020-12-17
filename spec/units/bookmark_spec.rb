require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it "returns a list of all saved bookmarks" do
      # Add the test data
      bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      Bookmark.create('DAS', 'http://www.destroyallsoftware.com')
      Bookmark.create('Google', 'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

    end
  end

  describe '.create' do
    it 'should add a bookmark to list of saved bookmarks' do
      bookmark = Bookmark.create('Test Bookmark', 'http://www.testbookmark.com')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe "#.delete" do
    it "should delete a bookmark from the list" do
      bookmark = Bookmark.create('first_test', "http://www.first_test.com")
      Bookmark.create('second_test', "http://www.second_test.com")
      # persisted_data = persisted_data(id: bookmark.id)
      Bookmark.delete('second_test', "http://www.second_test.com")
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq(1)
      expect(bookmarks.last.title).not_to eq('second_test')
    end
  end
end
