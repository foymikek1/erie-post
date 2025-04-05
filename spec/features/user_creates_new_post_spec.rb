require "rails_helper"

describe "user craetes new post", type: :feature do
  describe "they click on create a new post from visiting /posts" do
    it "they fill in post details" do
      visit posts_path
      click_link "Create a New Post"
      expect(current_path).to eq(new_post_path)
      

      fill_in "post[title]", with: "New Title!"
      fill_in "post[body]",  with: "New Body!"
      click_on "Create Post"
save_and_open_page
     expect(page).to have_content("New Title!")
     expect(page).to have_content("New Body!")
    end
  end
end