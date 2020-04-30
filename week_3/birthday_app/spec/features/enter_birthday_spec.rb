feature 'Enter Birthday' do
  scenario 'Submitting birthday' do
    visit("/")
    fill_in :name, with: "Gareth"
    fill_in :day, with: 12
    select("May", :from => "month")
    click_button 'Submit'
    expect(page).to have_content "Your birthday will be in 11 days, Gareth."
  end
end
