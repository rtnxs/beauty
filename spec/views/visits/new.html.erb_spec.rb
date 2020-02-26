# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/new', type: :view do
  let(:client_visit) { create(:visit) }
  let!(:service1) { create(:service) }
  let!(:service2) { create(:service) }
  let(:user) { create(:user) }

  before do
    log_in user
  end

  it 'renders new visit form' do
    visit new_visit_path

    aggregate_failures 'expected result' do
      expect(page).to have_content('Создать новый визит')
      expect(page).to have_content('Name')
      expect(page).to have_content('Phone')
      expect(page).to have_content('Datetime')
      expect(page).to have_content('Note')
      expect(page).to have_content('Area of services')
      expect(page).to have_content("#{service1.name} (#{service1.price}")
      expect(page).to have_content("#{service2.name} (#{service2.price}")
      expect(page.find(:xpath, "//div[@class='form-actions']/input").value).to eql('Сохранить запись')
      expect(page).to have_content('Для возврата к общему списку всех визитов - воспользуйся меню слева')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Выйти')
    end
  end
end
