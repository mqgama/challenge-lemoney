require 'rails_helper'

RSpec.feature Offer do
  given!(:user) { create(:user) }

  before { login_as user, scope: :user }

  scenario 'create update and destroy Offer', js: true do
    visit root_path

    click_link 'Ofertas'
    click_link 'Novo'

    fill_in 'Anunciante', with: 'Walmart'
    fill_in 'URL', with: 'https://www.walmart.com'
    fill_in 'Descrição', with: 'Ofertas do Walmart'
    fill_in 'Início', with: '30/11/2020'

    click_button 'Salvar'

    expect(page).to have_content 'Oferta cadastrado(a) com sucesso.'

    click_link 'Editar'

    expect(page).to have_field 'Anunciante', with: 'Walmart'
    expect(page).to have_field 'URL', with: 'https://www.walmart.com'
    expect(page).to have_field 'Descrição', with: 'Ofertas do Walmart'
    expect(page).to have_field 'Início', with: '2020-11-30'

    fill_in 'Descrição', with: 'Ofertas do Walmart web'

    click_button 'Salvar'

    expect(page).to have_content 'Oferta atualizado(a) com sucesso.'
    click_link 'Editar'

    expect(page).to have_field 'Anunciante', with: 'Walmart'
    expect(page).to have_field 'URL', with: 'https://www.walmart.com'
    expect(page).to have_field 'Descrição', with: 'Ofertas do Walmart web'
    expect(page).to have_field 'Início', with: '2020-11-30'

    click_link 'Voltar'
    accept_confirm do
      click_link 'Excluir'
    end

    expect(page).to have_content 'Oferta excluído(a) com sucesso.'
    expect(page).not_to have_content 'Ofertas do Walmart web'
  end
end