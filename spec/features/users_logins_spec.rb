require 'rails_helper'

RSpec.feature "User Login", type: :feature do
  scenario 'with invalid password' do
    visit login_path
    fill_in 'Email', with: 'tete'
    fill_in 'Password', with: 'fdfdfd'
    click_button 'Log in'
    expect(page).to have_css '.flash-error'
    visit root_path
    expect(page).to have_no_css '.flash-error'
  end

  def login_attributes
    [:email, :password]
  end
end
