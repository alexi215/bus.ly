require 'spec_helper'

describe 'User can see homepage'
  it 'has the title Bus.ly'
    visit root_path
    expect(page.to have_content) 'Bus.ly'
  end
end
