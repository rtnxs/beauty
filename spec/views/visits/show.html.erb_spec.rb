# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/show', type: :view do
  let(:client_visit) { create(:visit) }

  it 'renders attributes in <p>' do
    visit visit_path(client_visit)

    aggregate_failures 'expected result' do
      expect(page.find(
        :xpath, "//div[@class='col-lg-12']/p[1]"
      ).text).to eql("Клиент: #{client_visit.client.name}, тел - #{client_visit.client.phone}")
      expect(page.find(
        :xpath, "//div[@class='col-lg-12']/p[2]"
      ).text).to eql("Время визита: #{client_visit.datetime.strftime('%Y.%m.%d %H:%M')}")
      expect(page.find(
        :xpath, "//div[@class='col-lg-12']/p[3]"
      ).text).to eql("Цена визита: #{client_visit.visit_price}")
      expect(page.find(
        :xpath, "//div[@class='col-lg-12']/p[4]"
      ).text).to eql("Примечание: #{client_visit.note}")
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
