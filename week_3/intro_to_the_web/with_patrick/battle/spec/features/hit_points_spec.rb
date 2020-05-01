feature 'View hit points' do
  scenario 'see PLayer 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end
end
