feature "add bookmarks" do

    feature 'Adding a new bookmark' do
      scenario 'A user can add a bookmark to Bookmark Manager' do
        visit('/bookmarks/new')
        fill_in('url', with: 'https://www.reddit.com/r/birdswitharms/')
        fill_in('title', with: 'Birds With Arms')
        click_button('submit')

        expect(page).to have_link('Birds With Arms', href: 'https://www.reddit.com/r/birdswitharms/')
      end
    end
  end
