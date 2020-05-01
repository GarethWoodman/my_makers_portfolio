require './lib/player'
require './lib/game'

feature 'View hit points' do
  scenario 'see PLayer 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens: 60HP'
  end

  scenario 'see PLayer 1 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Dave: 60HP'
  end

  scenario "player 1 loses and displays 'Lose' message" do
    sign_in_and_play
    11.times { click_button 'Attack' }
    expect(page).to have_content 'Dave wins'
  end
end
