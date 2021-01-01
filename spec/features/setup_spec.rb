feature "bookmark manager" do
  scenario "homepage contains text hello world" do
    visit("/")
    expect(page).to have_content("Bookmark Manager")
  end
end
