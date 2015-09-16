require 'spec_helper'
require 'board'
require 'cell'

feature 'Starting a new game' do

  before (:each) do
    $player = Player.new
  end

  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end
  scenario 'Page has field to input name' do
    visit '/new_game'
    expect(page).to have_field('name')
  end
  scenario 'Submit button exists' do
    visit '/new_game'
    expect(page).to have_selector("input[type='submit'][value='Submit']")
  end
  scenario 'I can input my name into form' do
    visit '/new_game'
    fill_in 'name', with: 'Harry'
    click_button 'Submit'
    expect(page).to have_content('Welcome to BattleshipsWeb, Harry')
  end
  scenario 'It has a link to a new game' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    expect(page).to have_selector("input[type='submit'][value='Start Game']")
  end
  scenario 'It will generate a new board' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    expect(page).to have_css("div[id='water']", count: 100)
  end
  scenario 'I will welcome to you to the board' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    expect(page).to have_content("Welcome to the board, Mike")
  end
  scenario 'Place an aircraft carrier horizontally' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'aircraft_carrier', with: "A1"
    fill_in 'ac_orientation', with: "horizontally"
    click_button 'Place Aircraft Carrier'
    expect(page).to have_css("div[id='water']", count: 95)
  end
  scenario 'Place an aircraft carrier vertically' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'aircraft_carrier', with: "F10"
    fill_in 'ac_orientation', with: "vertically"
    click_button 'Place Aircraft Carrier'
    expect(page).to have_css("div[id='water']", count: 95)
  end
  scenario 'Place a Battleship horizontally' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'battleship', with: "B1"
    fill_in 'bs_orientation', with: "horizontally"
    click_button 'Place Battleship'
    expect(page).to have_css("div[id='water']", count: 96)
  end
  scenario 'Place a Battleship vertically' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'battleship', with: "F9"
    fill_in 'bs_orientation', with: "vertically"
    click_button 'Place Battleship'
    expect(page).to have_css("div[id='water']", count: 96)
  end
  scenario 'Place a Submarine horizontally' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'submarine', with: "C1"
    fill_in 'sb_orientation', with: "horizontally"
    click_button 'Place Submarine'
    expect(page).to have_css("div[id='water']", count: 97)
  end
  scenario 'Place a Submarine vertically' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'submarine', with: "F8"
    fill_in 'sb_orientation', with: "vertically"
    click_button 'Place Submarine'
    expect(page).to have_css("div[id='water']", count: 97)
  end
  scenario 'Place a Destroyer horizontally' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'destroyer', with: "D1"
    fill_in 'ds_orientation', with: "horizontally"
    click_button 'Place Destroyer'
    expect(page).to have_css("div[id='water']", count: 97)
  end
  scenario 'Place a Destroyer vertically' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'destroyer', with: "F7"
    fill_in 'ds_orientation', with: "vertically"
    click_button 'Place Destroyer'
    expect(page).to have_css("div[id='water']", count: 97)
  end
  scenario 'Place a Patrol Boat horizontally' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'patrol_boat', with: "E1"
    fill_in 'pb_orientation', with: "horizontally"
    click_button 'Place Patrol Boat'
    expect(page).to have_css("div[id='water']", count: 98)
  end
  scenario 'Place a Patrol Boat vertically' do
    visit '/new_game'
    fill_in 'name', with: 'Mike'
    click_button 'Submit'
    click_button 'Start Game'
    fill_in 'patrol_boat', with: "F6"
    fill_in 'pb_orientation', with: "vertically"
    click_button 'Place Patrol Boat'
    expect(page).to have_css("div[id='water']", count: 98)
  end

end
