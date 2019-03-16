require 'rails_helper'

RSpec.feature 'UserPages', type: :feature do
  scenario 'show exact row count user in index page' do
    row_count = 5
    create_list :user, row_count, :unique_name, :with_tasks

    visit users_path
    tbody = page.find(:css, 'tbody')

    expect(tbody.all(:css, 'tr').size).to eq row_count
    expect(tbody).to have_link 'Edit'
    expect(tbody).to have_link 'Delete'
  end
end
