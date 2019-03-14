require 'rails_helper'

RSpec.feature 'UserPages', type: :feature do
  scenario 'show exact row count user in index page' do
    create_list :user, 5, :unique_name

    visit users_path
    tbody = page.find(:css, 'tbody')

    expect(tbody.all(:css, 'tr').size).to eq 5
  end
end
