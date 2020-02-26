# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/show', type: :view do
  let(:client) { create(:client) }
  let(:user) { create(:user) }

  before do
    log_in user
  end

  it 'renders attributes in <p>' do
    visit client_path(client)

    aggregate_failures 'expected result' do
      expect(page).to have_content(client.name)
      expect(page).to have_content(client.phone)
      expect(page).to have_content(client.note)
      expect(page).to have_content('Изменить эту запись')
      expect(page).to have_content('Посмотреть все')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Выйти')
    end
  end
end
