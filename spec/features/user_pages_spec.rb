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
  scenario 'create user' do
    prev_user_count = User.count
    name            = Faker::Name.name
    visit new_user_path
    fill_in 'custom_id_name', with: name
    click_button 'Submit'

    expect(User.count).to eq prev_user_count+1
    expect(page).to have_content "User was successfully created. name = #{name}"
  end
  scenario 'show user detail' do
    user = create :user
    visit user_path(user)

    expect(page).to have_content "name = #{user.name}"
  end
  scenario 'delete user' do
    user            = create :user
    prev_user_count = User.count
    visit users_path
    click_on 'Delete'

    expect(User.count).to eq prev_user_count - 1
  end
  scenario 'edit specific user' do
    user          = create :user
    new_user_name = Faker::Name.name
    visit edit_user_path(user)
    fill_in 'custom_id_name', with: new_user_name
    click_on 'Submit'

    expect(user.name).not_to eq new_user_name
    expect(user.id).to eq User.last.id
    expect(User.last.name).to eq new_user_name
  end
end
