
feature 'Testing framework' do
  scenario 'should display Hello World' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing Bookmarks' do
  scenario 'display bookmarks' do
    visit('/')
    click_button("Bookmarks")
    expect(page).to have_content 'Bookmarks'
  end
end
