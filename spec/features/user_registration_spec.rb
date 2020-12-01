require "rails_helper"

RSpec.feature 'UserRegistration' do
  scenario 'Create user', js: true do
    visit root_path
    click_link 'Cadastrar'
    fill_in 'E-mail', with: 'jose@email.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme sua senha', with: '123456'
    click_on 'Cadastrar'
    expect(page).to have_content 'Dashboard'
  end
end