feature 'adding bookmarks' do
  scenario 'add new link to bookmark manager' do
    visit('/bookmarks/add')
    fill_in('url', :with => 'www.dummywebsite.com')
    click_button('submit')
    expect(page).to have_content 'www.dummywebsite.com'
  end
end
