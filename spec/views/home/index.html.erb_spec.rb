# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  it 'renders index without menu' do
    visit root_path

    aggregate_failures 'expected result' do
      expect(page).to have_content('Home#index')
      expect(page).to have_content('Find me in app/views/home/index.html.erb')

      expect(page).not_to have_content('Доступные разделы')
      expect(page).not_to have_content('В начало')
      expect(page).not_to have_content('Добавить новый визит')
      expect(page).not_to have_content('Добавить новый расход')
      expect(page).not_to have_content('Справочники')
      expect(page).not_to have_content('Войти')
    end
  end
end
