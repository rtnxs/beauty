# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'services/edit', type: :view do
  let(:service) { create(:service) }
  let(:user) { create(:admin_user) }

  before do
    log_in user
  end

  context 'when the user is an admin' do
    it 'renders the edit service form' do
      visit edit_service_path(service)

      aggregate_failures 'expected result' do
        expect(page).to have_content('Изменить запись')
        expect(page).to have_content('Name')
        expect(page).to have_content('Price')
        expect(page.find(:xpath, "//input[@id='service_name']").value).to eql(service.name)
        expect(page.find(:xpath, "//input[@id='service_price']").value).to eql(service.price.to_s)
        expect(page.find(:xpath, "//input[@type='submit']").value).to eql('Сохранить запись')

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
      visit edit_service_path(service)

      aggregate_failures 'expected result' do
        expect(page).to have_content('Доступно только администратору')
      end
    end
  end
end
