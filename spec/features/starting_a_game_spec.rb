require 'spec_helper'

feature 'Starting a new game' do
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
    expect(current_url).to have_content('Harry')
  end
end
