# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  let(:user) { create(:user) }
  let(:admin_user) { create(:admin_user) }

  it 'renders attributes for no admin user' do
    visit user_path(user)

    aggregate_failures 'expected result' do
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Admin')
      expect(page.find(:xpath, "//div[@class='col-lg-12']/p[1]").text).to eql("Email: #{user.email}")
      expect(page.find(:xpath, "//div[@class='col-lg-12']/p[3]").text).to eql('Admin: false')
      expect(page).to have_content('Изменить эту запись')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Войти')
    end
  end

  it 'renders attributes for admin user' do
    visit user_path(admin_user)

    expect(page.find(:xpath, "//div[@class='col-lg-12']/p[3]").text).to eql('Admin: true')
  end
end
