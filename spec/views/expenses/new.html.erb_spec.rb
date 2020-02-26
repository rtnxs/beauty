# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/new', type: :view do
  let(:user) { create(:user) }

  before do
    log_in user
  end

  it 'renders new expense form' do
    visit new_expense_path

    aggregate_failures 'expected result' do
      expect(page).to have_content('Новая запись расхода')
      expect(page).to have_content('Name')
      expect(page).to have_content('Price')
      expect(page).to have_content('Note')
      expect(page).to have_content('Datetime')
      expect(page.find(:xpath, "//div[@class='form-actions']/input").value).to eql('Сохранить запись')
      expect(page).to have_content('Для возврата к общему списку расходов - воспользуйся меню слева')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Выйти')
    end
  end
end
