# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'clients/index', type: :view do
  let(:client) { create(:client) }
  let(:user) { create(:user) }

  before do
    log_in user
  end

  it 'renders a list of clients' do
    expect(client).to eql(Client.last)
    visit clients_path

    aggregate_failures 'expected result' do
      expect(page.find(:xpath, '//tbody/tr/td[1]').text).to eql(client.name)
      expect(page.find(:xpath, '//tbody/tr/td[2]').text).to eql(client.phone)
      expect(page.find(:xpath, '//tbody/tr/td[3]').text).to eql(client.note)
      expect(page.find(:xpath, '//tbody/tr/td[4]').text).to eql('Изменить Удалить')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Выйти')
    end
  end
end
