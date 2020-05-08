feature "delete entries" do

  feature "delete an entry" do
    scenario "A user can delete an entry" do
      # Setup Test
      Diary.add_entry(title: 'First entry', entry: 'first day')
      visit('/entries')
      expect(page).to have_content('First entry')

      # Execute
      first('.entry').click_button 'Delete'

      # Verify
      expect(current_path).to eq "/entries"
      expect("/entries").not_to have_content('First entry')
    end
  end
end
