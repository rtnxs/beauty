# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  let(:user) { create(:user) }
  let(:admin_user) { create(:admin_user) }

  it 'renders the edit user form' do
    visit edit_user_path(user)

    aggregate_failures 'expected result' do
      expect(page).to have_content('Email')
      expect(page).to have_content('Name')
      expect(page).to have_content('Пароль')
      expect(page).to have_content('Admin')
      expect(page.find(:xpath, "//input[@id='user_email']").value).to eql(user.email)
      expect(page.find(:xpath, "//input[@id='user_name']").value).to eql(user.name)
      expect(page).not_to have_xpath("//input[@id='user_admin']/@checked")
      expect(page.find(:xpath, "//input[@type='submit']").value).to eql('Сохранить запись')

      expect(page).to have_content('Доступные разделы')
      expect(page).to have_content('В начало')
      expect(page).to have_content('Добавить новый визит')
      expect(page).to have_content('Добавить новый расход')
      expect(page).to have_content('Справочники')
      expect(page).to have_content('Войти')
    end
  end

  it 'renders the edit user form for admin' do
    visit edit_user_path(admin_user)

    expect(page).to have_xpath("//input[@id='user_admin']/@checked")
  end
end
