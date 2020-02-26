# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'types/new', type: :view do
  let(:user) { create(:admin_user) }

  before do
    log_in user
  end

  context 'when the user is an admin' do
    it 'renders new type form' do
      visit new_type_path

      aggregate_failures 'expected result' do
        expect(page).to have_content('Добавить новый расход')
        expect(page).to have_content('Name')
        expect(page.find(:xpath, "//div[@class='form-actions']/input").value).to eql('Сохранить запись')
        expect(page).to have_content('Назад')

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
      visit new_type_path

      aggregate_failures 'expected result' do
        expect(page).to have_content('Доступно только администратору')
      end
    end
  end
end
