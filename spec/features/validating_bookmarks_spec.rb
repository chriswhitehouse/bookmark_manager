feature "validating bookmarks" do
  scenario "A user will be alerted to an invalid bookmark" do
    bookmark = Bookmark.create(title: "Test", url: "https://www.test.com")
    visit("/bookmarks/new")
    fill_in("url", with: "blah blah blah")
    click_button("Submit")

    expect(page).not_to have_content("blah blah blah")
    expect(page).to have_content("Invalid URL")
  end
end
