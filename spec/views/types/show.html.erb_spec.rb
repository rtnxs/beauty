# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'types/show', type: :view do
  let(:type) { create(:type) }

  it 'renders attributes in <p>' do
    visit type_path(type)

    aggregate_failures 'expected result' do
      expect(page).to have_content(type.name)
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
