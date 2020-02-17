# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/new', type: :view do
  it 'renders new client form' do
    visit new_client_path

    expect(page).to have_content('Новый клиент')
    expect(page).to have_content('Name')
    expect(page).to have_content('Phone')
    expect(page).to have_content('Note')
    expect(page.find(:xpath, "//div[@class='form-actions']/input").value).to eql('Сохранить запись')
    expect(page).to have_content('Для возврата к общему списку клиентов - воспользуйся меню слева')

    expect(page).to have_content('Доступные разделы')
    expect(page).to have_content('В начало')
    expect(page).to have_content('Добавить новый визит')
    expect(page).to have_content('Добавить новый расход')
    expect(page).to have_content('Справочники')
    expect(page).to have_content('Войти')
  end
end
