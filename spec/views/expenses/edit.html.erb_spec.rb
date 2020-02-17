# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/edit', type: :view do
  let(:expense) { create(:expense) }

  it 'renders the edit expense form' do
    visit edit_expense_path(expense)

    aggregate_failures 'expected result' do
      expect(page).to have_content('Изменить запись')
      expect(page).to have_content('Type')
      expect(page).to have_content('Name')
      expect(page).to have_content('Price')
      expect(page).to have_content('Note')
      expect(page).to have_content('Datetime')
      expect(page.find(:xpath, "//select[@id='expense_type_id']").text).to eql(expense.type.name)
      expect(page.find(:xpath, "//input[@id='expense_name']").value).to eql(expense.name)
      expect(page.find(:xpath, "//input[@id='expense_price']").value).to eql(expense.price.to_s)
      expect(page.find(:xpath, "//input[@id='expense_note']").value).to eql(expense.note)
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
