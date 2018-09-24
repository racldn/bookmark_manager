
feature 'Testing framework' do
  scenario 'should display Hello World' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing Bookmarks' do
  scenario 'display bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
