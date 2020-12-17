feature 'viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
    Bookmark.create(title: 'DAS', url: 'http://www.destroyallsoftware.com')
    Bookmark.create(title: 'Google', url: 'http://www.google.com')

    visit('/bookmarks')

    expect(page).to have_content "Makers"
    expect(page).to have_content "DAS"
    expect(page).to have_content "Google"
  end
end
