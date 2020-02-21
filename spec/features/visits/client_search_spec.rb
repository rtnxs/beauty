# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'visits/edit', type: :feature, js: true do
  let(:client_visit) { create(:visit) }

  before do
    create(:client, name: 'Клавдия Ивановна Пушок')
  end

  it 'changes client for visit' do
    # skip('Until has problem with chromium in GitLub')
    visit edit_visit_path(client_visit)
    page.find(:xpath, "//span[@class='select2-selection__arrow']").click
    page.find(:xpath, "//input[@class='select2-search__field']").set('пуш')
    page.find(:xpath, "//ul[@id='select2-visit_client_id-results']/li[1]").click
    click_button 'Сохранить запись'

    expect(page).to have_content('Клавдия Ивановна Пушок')
  end
end
