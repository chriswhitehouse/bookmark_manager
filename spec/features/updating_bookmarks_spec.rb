feature 'Updating a bookmark' do
  scenario 'A user # COMBAK: n update a bookmark' do
    bookmark = Bookmark.create(title: "Test", url: "https://www.test.com")
    visit('/bookmarks')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('title', with: 'Test2')
    fill_in('url', with: 'https://www.test2.com')
    click_button("Submit")

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Test', href: 'https://www.test.com')
    expect(page).to have_link('Test2', href: 'https://www.test2.com')

  end
end
