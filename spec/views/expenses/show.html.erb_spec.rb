# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'expenses/show', type: :view do
  let(:expense) { create(:expense) }

  it 'renders attributes in <p>' do
    visit expense_path(expense)

    aggregate_failures 'expected result' do
      expect(page).to have_content(expense.type_id)
      expect(page).to have_content(expense.name)
      expect(page).to have_content(expense.price.to_s)
      expect(page).to have_content(expense.note)
      expect(page).to have_content(expense.datetime.strftime('%Y.%m.%d %H:%M'))
      expect(page).to have_content('Изменить эту запись')
      expect(page).to have_content('Посмотреть все')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Войти')
    end
  end
end
