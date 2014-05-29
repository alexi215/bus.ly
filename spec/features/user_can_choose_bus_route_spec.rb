require "spec_helper"

describe "a user can choose a bus route" do
    
  it "can visit the bus route page" do
    visit predictions_path
    expect(page).to have_content 'Select a route'
  end

  it "can click drop-down menu and select a desired bus route" do
    visit predictions_path
    select('X2', :from => 'Choose Bus Line')
    # expect(form).to have_content 'X2'
  end


end # END of describe
