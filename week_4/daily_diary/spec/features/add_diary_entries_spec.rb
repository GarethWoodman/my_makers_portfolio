feature "add entries" do

  feature "adding a new diary entry" do
    scenario "A user can add an entry to their Daily Diary" do
      visit('/entries/new')
      fill_in('entry', with: 'The day it all started')
      fill_in('title', with: 'First entry')
      click_button('Submit')

      #link = 'http:localhost:9292/entries/1'
      expect(page).to have_link('First entry')
    end
  end
end
