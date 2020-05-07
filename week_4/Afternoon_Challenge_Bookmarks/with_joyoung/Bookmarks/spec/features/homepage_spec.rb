require 'spec_helper'

feature "displays the homepage" do
  scenario "should return string" do
    visit("/")
    expect(page).to have_content "Hello World!"
  end
end