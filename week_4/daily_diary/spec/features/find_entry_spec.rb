feature "find entries" do

  feature "adding a new diary entry" do
    scenario "A user can add an entry to their Daily Diary" do
      visit('/entries/new')
      fill_in('entry', with: 'The day it all started')
      fill_in('title', with: 'First entry')
      click_button('Submit')

      click_link('First entry')

      expect(page).to have_content('The day it all started')
    end
  end
end
