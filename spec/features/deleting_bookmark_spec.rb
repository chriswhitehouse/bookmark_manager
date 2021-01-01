feature "deleting bookmarks" do
  scenario "deletes one bookmark from the list" do
    Bookmark.create(title: "Test1", url: "http://www.test1.com")
    visit("/bookmarks")
    first(".bookmark").click_button("Delete")

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("Test1", href: "http://www.test1.com")
  end
end
