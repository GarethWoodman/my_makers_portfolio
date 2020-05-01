feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Dave: 60HP vs. Mittens: 60HP'
  end
end
