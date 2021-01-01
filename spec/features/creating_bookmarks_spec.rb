feature "add bookmark" do
  scenario "allows user to add a bookmark to the list" do
    visit "/bookmarks"
    click_button("Add")
    expect(page).to have_field("url")
    expect(page).to have_button("Submit")
  end

  scenario "lists bookmark just added" do
    visit "/bookmarks"
    click_button("Add")
    fill_in("url", with: "http://www.bbc.co.uk")
    fill_in("title", with: "BBC")
    click_button("Submit")
    expect(page).to have_link("BBC", href: "http://www.bbc.co.uk")
  end
end
