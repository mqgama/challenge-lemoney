require "rails_helper"

RSpec.feature 'Authentication' do

  scenario 'login with a wrong user/password', js: true do
    visit root_path
    fill_in 'user[email]', with: 'foo@example.com'
    fill_in 'user[password]', with: '12345678'
    click_on 'Entrar'
    expect(page).to have_content 'E-mail ou senha inválida.'
  end

  given(:user) { create(:user) }

  scenario 'login with a valid a user/password', js: true do

    visit root_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Entrar'
    expect(page).to have_content 'Dashboard'
  end
end
