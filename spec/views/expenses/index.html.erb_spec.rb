# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/index', type: :view do
  let(:expense) { create(:expense) }

  it 'renders a list of expenses' do
    expect(expense).to eql(Expense.last)
    visit expenses_path

    aggregate_failures 'expected result' do
      expect(page.find(:xpath, '//tbody/tr/td[1]').text).to eql(expense.type.name)
      expect(page.find(:xpath, '//tbody/tr/td[2]').text).to eql(expense.name)
      expect(page.find(:xpath, '//tbody/tr/td[3]').text).to eql(expense.price.to_s)
      expect(page.find(:xpath, '//tbody/tr/td[4]').text).to eql(expense.note)
      expect(page.find(:xpath, '//tbody/tr/td[5]').text).to eql(expense.datetime.strftime('%Y.%m.%d %H:%M'))
      expect(page.find(:xpath, '//tbody/tr/td[6]').text).to eql('Изменить Удалить')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Войти')
    end
  end
end
