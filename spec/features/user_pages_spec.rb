require 'rails_helper'

RSpec.feature 'UserPages', type: :feature do
  scenario 'show exact row count user in index page' do
    row_count = 5
    create_list :user, row_count, :unique_name, :with_3_tasks

    visit users_path
    tbody = page.find(:css, 'tbody')

    expect(tbody.all(:css, 'tr').size).to eq row_count
    expect(tbody).to have_link 'Edit'
    expect(tbody).to have_link 'Delete'
  end
  scenario 'show form in new user page' do
    visit new_user_path

    expect(page).to have_selector '#custom_id_name'
    expect(page).to have_field 'custom_id_name'
    expect(page).to have_button 'Submit'
  end
  scenario 'user creation' do
    prev_user_count = User.count
    name            = Faker::Name.name
    visit new_user_path
    fill_in 'custom_id_name', with: name
    click_button 'Submit'

    expect(User.count).to eq prev_user_count+1
    expect(page).to have_content "User was successfully created. name = #{name}"
  end
end
