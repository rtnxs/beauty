# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'types/index', type: :view do
  let(:type) { create(:type) }
  let(:user) { create(:admin_user) }

  before do
    log_in user
  end

  context 'when the user is an admin' do
    it 'renders a list of types' do
      expect(type).to eql(Type.last)
      visit types_path

      aggregate_failures 'expected result' do
        expect(page.find(:xpath, '//tbody/tr/td[1]').text).to eql(type.name)
        expect(page.find(:xpath, '//tbody/tr/td[2]').text).to eql('Изменить Удалить')

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
      visit types_path

      aggregate_failures 'expected result' do
        expect(page).to have_content('Доступно только администратору')
      end
    end
  end
end
