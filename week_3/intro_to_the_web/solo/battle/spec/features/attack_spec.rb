feature 'Attacking' do
  def first_turn_attack
    sign_in_and_play
    click_button 'Attack'
  end

  scenario 'attack Player 2' do
    first_turn_attack
    expect(page).to have_content 'Mittens: 50HP'
  end

  scenario 'attack Player 1 after attacking player 2' do
    first_turn_attack
    click_button 'Attack'
    expect(page).to have_content 'Dave: 50HP'
  end
end
