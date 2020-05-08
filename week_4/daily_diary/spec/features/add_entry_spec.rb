feature "add entries" do

  feature "adding a new diary entry" do
    scenario "A user can add an entry to their Daily Diary" do
      add_entry
      expect(page).to have_link('First entry')
    end
  end
end
