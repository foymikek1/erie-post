require "rails_helper"

describe "user delete post", type: :feature do
  describe "they link to the show page and delete post" do
    it "displays index page with all posts, less deleted" do
      post_1 = Post.create!(title: "Title 1", body: "Body 1")
      post_2 = Post.create!(title: "Title 2", body: "Body 2")

      visit post_path(post_1)
      save_and_open_page

      click_on "Delete Post"
      expect(current_path).to eq(posts_path)
      expect(page).to have_content(post_2.title)
      expect(page).to_not have_content(post_1.title)
    end
  end
end