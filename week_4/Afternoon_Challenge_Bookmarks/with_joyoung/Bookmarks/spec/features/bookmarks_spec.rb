require 'spec_helper'

feature "viewing bookmarks" do
  scenario "returns bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content "Bookmarks"
  end
end
