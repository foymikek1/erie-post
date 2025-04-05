require 'rails_helper'

RSpec.describe 'user edits post', type: :feature do
  describe 'link from show to edit' do
    it 'user fills in update form and submits' do
      post_1 = Post.create!(title: "Title 1", body: "Body 1")

      visit post_path(post_1)
      click_on "Edit"
      expect(current_path).to eq(edit_post_path(post_1))

      fill_in "post[title]", with: "New Title!"
      fill_in "post[body]",  with: "New Body!"
      click_on "Update Post"

      expect(current_path).to eq(post_path(post_1))
      expect(page).to have_content("New Title!")
      expect(page).to have_content("New Body!")
    end
  end
end