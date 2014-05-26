require "spec_helper"

describe 'User can see homepage'do
  it 'has the title Bus.ly' do
    visit root_path
    expect(page).to have_content 'Bus.ly'
  end
end
