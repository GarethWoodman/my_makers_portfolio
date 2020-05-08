def add_entry
  visit('/entries/new')
  fill_in('entry', with: 'The day it all started')
  fill_in('title', with: 'First entry')
  click_button('Submit')
end
