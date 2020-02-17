# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/edit', type: :view do
  let(:client_visit) { create(:visit) }

  it 'renders the edit visit form' do
    visit edit_visit_path(client_visit)

    aggregate_failures 'expected result' do
      expect(page).to have_content('Client')
      expect(page).to have_content('Datetime')
      expect(page).to have_content('Visit price')
      expect(page).to have_content('Note')
      expect(page.find(
        :xpath, "//select[@id='visit_client_id']"
      ).text).to eql(client_visit.client.name)
      expect(page.find(:xpath, "//input[@id='visit_visit_price']").value).to eql(client_visit.visit_price.to_s)
      expect(page.find(:xpath, "//input[@id='visit_note']").value).to eql(client_visit.note)
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
