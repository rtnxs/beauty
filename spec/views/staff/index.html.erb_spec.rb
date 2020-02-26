# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'staff/index.html.erb', type: :view do
  let(:user) { create(:admin_user) }

  before do
    log_in user
  end

  context 'when not admin' do
    it 'renders staff index' do
      visit staff_index_path

      aggregate_failures 'expected result' do
        expect(page).to have_content('Доходы')
        expect(page).to have_content('Расходы')
        expect(page).to have_content('Чистыми')
        expect(page).to have_content('Визиты за этот месяц')
        expect(page).to have_content('Расходы за этот месяц')

        expect(page).to have_content('Доступные разделы')
        expect(page).to have_content('В начало')
        expect(page).to have_content('Добавить новый визит')
        expect(page).to have_content('Добавить новый расход')
        expect(page).to have_content('Справочники')
        expect(page).to have_content('Выйти')
      end
    end
  end

  context 'when not admin' do
    it 'redirect to index' do
      user.update(admin: false)
      visit staff_index_path

      aggregate_failures 'expected result' do
        expect(page).to have_content('Доступно только администратору')
      end
    end
  end
end
