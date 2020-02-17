# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/edit', type: :view do
  let(:client) { create(:client) }

  it 'renders the edit client form' do
    visit edit_client_path(client)

    aggregate_failures 'expected result' do
      expect(page).to have_content('Изменить запись')
      expect(page).to have_content('Name')
      expect(page).to have_content('Phone')
      expect(page).to have_content('Note')
      expect(page.find(:xpath, "//input[@id='client_name']").value).to eql(client.name)
      expect(page.find(:xpath, "//input[@id='client_phone']").value).to eql(client.phone)
      expect(page.find(:xpath, "//input[@id='client_note']").value).to eql(client.note)
      expect(page.find(:xpath, "//input[@type='submit']").value).to eql('Сохранить запись')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Войти')
    end
  end
end
