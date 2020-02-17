# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'types/edit', type: :view do
  let(:type) { create(:type) }

  it 'renders the edit type form' do
    visit edit_type_path(type)

    aggregate_failures 'expected result' do
      expect(page).to have_content('Name')
      expect(page.find(:xpath, "//input[@id='type_name']").value).to eql(type.name)
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
