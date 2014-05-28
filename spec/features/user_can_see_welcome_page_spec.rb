require 'spec_helper'

describe 'User can visit and navigate away from welcome page'do
  it 'has the title Bus.ly' do
    visit root_path
    expect(page).to have_content 'Bus.ly'
  end

  it 'navigates to the predictions homepage' do
    visit root_path
    click_link 'Skip to Bus Predictions'
    expect(page).to have_content 'Select a route'
  end
end # END of describe 
