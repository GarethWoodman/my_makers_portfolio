feature 'Bookmark View' do
  scenario 'when visiting the homepage it displays name' do
  visit '/'
  expect(page).to have_content 'Bookmark Manager'
  end

end

# feature "viewing bookmarks" do
#   scenario "when visiting /bookmarks it displays list of bookmarks" do
#     visit '/'
#     click_on "Bookmarks"
#     expect(page).to have_content "http://google.com"
#     expect(page).to have_content "http://github.com"
#   end
# end
