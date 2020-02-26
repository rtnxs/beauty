# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  let(:user) { create(:admin_user) }

  before do
    log_in user
  end

  context 'when the user is an admin' do
    it 'renders the edit user form' do
      visit edit_user_path(user)

      aggregate_failures 'expected result' do
        expect(page).to have_content('Email')
        expect(page).to have_content('Имя')
        expect(page).to have_content('Пароль')
        expect(page).to have_content('Admin')
        expect(page.find(:xpath, "//input[@id='user_email']").value).to eql(user.email)
        expect(page.find(:xpath, "//input[@id='user_name']").value).to eql(user.name)
        expect(page.find(:xpath, "//input[@type='submit']").value).to eql('Сохранить запись')
        expect(page).to have_xpath("//input[@id='user_admin']/@checked")

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
      visit edit_user_path(user)

      aggregate_failures 'expected result' do
        expect(page).to have_content('Доступно только администратору')
      end
    end
  end
end
