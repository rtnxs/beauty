# frozen_string_literal: true

module CapybaraHelpers
  def log_in(user)
    visit new_user_session_path
    page.find(:xpath, "//input[@id='user_email']").set(user.email)
    page.find(:xpath, "//input[@id='user_password']").set(user.password)
    page.find(:xpath, "//*[@type='submit']").click
  end
end
