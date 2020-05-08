feature "find entries" do

  feature "finding an entry by click on their title" do
    scenario "A user can find an entry by clicking it's title" do
      add_entry
      click_link('First entry')

      expect(page).to have_content('The day it all started')
    end
  end
end
