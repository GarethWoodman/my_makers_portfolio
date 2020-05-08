feature "update entries" do

  feature "updating an exsisting diary entry" do
    scenario "A user can update an exsisting diary entry" do
      entry = Diary.add_entry(title: "Gareth Woodman", entry: "Day 20 - Help")
      visit('/entries')
      expect(page).to have_link('Gareth Woodman')

      first('.entry').click_button 'Edit'
      expect(current_path).to eq "/entries/#{entry.id}/edit"

      fill_in('title', with: "Garry Willyman")
      fill_in('entry', with: "They have changed my name??!!")
      click_button('Submit')

      expect(current_path).to eq '/entries'
      expect(page).not_to have_link('Gareth Woodman')
      expect(page).to have_link('Garry Willyman')
    end
  end
end
