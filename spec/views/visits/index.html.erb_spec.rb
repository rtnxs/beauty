# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/index', type: :view do
  let(:client_visit) { create(:visit) }
  let(:user) { create(:admin_user) }

  before do
    log_in user
  end

  context 'when the user is an admin' do
    it 'renders a list of visits' do
      expect(client_visit).to eql(Visit.last)
      visit visits_path

      aggregate_failures 'expected result' do
        expect(page.find(:xpath, '//tbody/tr/td[1]').text).to eql(client_visit.client.name)
        expect(page.find(:xpath, '//tbody/tr/td[2]').text).to eql(client_visit.datetime.strftime('%Y.%m.%d %H:%M'))
        expect(page.find(:xpath, '//tbody/tr/td[3]').text).to eql(client_visit.visit_price.to_s)
        expect(page.find(:xpath, '//tbody/tr/td[4]').text).to eql(client_visit.note)
        expect(page.find(:xpath, '//tbody/tr/td[5]').text).to eql('Изменить Удалить')

        expect(page).to have_content('Доступные разделы')
        expect(page).to have_content('В начало')
        expect(page).to have_content('Добавить новый визит')
        expect(page).to have_content('Добавить новый расход')
        expect(page).to have_content('Справочники')
        expect(page).to have_content('Выйти')
      end
    end
  end

  context 'when the user is not an admin' do
    it 'redirect to index' do
      user.update(admin: false)
      visit visits_path

      aggregate_failures 'expected result' do
        expect(page).to have_content('Доступно только администратору')
      end
    end
  end
end
