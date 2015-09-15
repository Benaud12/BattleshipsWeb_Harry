require 'spec_helper'

feature 'Starting a new game' do
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end
  scenario 'I can input my name into form' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_selector('input[type=submit]')
  end
end
