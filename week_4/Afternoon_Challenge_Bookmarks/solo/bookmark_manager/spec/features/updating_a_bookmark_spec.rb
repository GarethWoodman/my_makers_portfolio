feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")

    # Clicks first button produced by the .bookmark class in <li>
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    url = "http://www.snakersacademy.com"
    title = "Snakers Academy"

    fill_in('url', with: url)
    fill_in('title', with: title)
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://ww.makersacademy.com')
    expect(page).to have_link(title, href: url)
  end
end
