# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  let(:user) { create(:admin_user) }

  before do
    log_in user
  end

  context 'when the user is an admin' do
    it 'renders attributes for no admin user' do
      visit user_path(user)

      aggregate_failures 'expected result' do
        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
        expect(page).to have_content('Admin')
        expect(page.find(:xpath, "//div[@class='col-lg-12']/p[1]").text).to eql("Email: #{user.email}")
        expect(page.find(:xpath, "//div[@class='col-lg-12']/p[3]").text).to eql('Admin: true')
        expect(page).to have_content('Изменить эту запись')

        expect(page).to have_content('Доступные разделы')
        expect(page).to have_content('В начало')
        expect(page).to have_content('Добавить новый визит')
        expect(page).to have_content('Добавить новый расход')
        expect(page).to have_content('Справочники')
        expect(page).to have_content('Выйти')
      end
    end
  end

  context 'when the user is not an admin' do
    it 'redirect to index' do
      user.update(admin: false)
      visit user_path(user)

      aggregate_failures 'expected result' do
        expect(page).to have_content('Доступно только администратору')
      end
    end
  end
end
