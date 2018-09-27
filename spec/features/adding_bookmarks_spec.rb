feature 'adding bookmarks' do
  scenario 'add new link to bookmark manager' do
    visit('/bookmarks/add')
    fill_in('url', :with => 'http://www.dummywebsite.com')
    click_button('submit')
    expect(page).to have_content 'http://www.dummywebsite.com'
  end

  scenario 'raise error when user submit invalid input' do
    visit('/bookmarks/add')
    fill_in('url', :with => '1234')
    click_button('submit')
    expect(page).to have_content('Invalid input')
    # expect{click_button('submit')}.to raise_error('Invalid input')
  end
end
