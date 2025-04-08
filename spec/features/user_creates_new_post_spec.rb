require "rails_helper"

describe "user craetes new post", type: :feature do
  describe "they click on create a new post from visiting /posts" do
    it "they fill in post details" do
      visit posts_path
      click_link "Create a New Post"
      expect(current_path).to eq(new_post_path)
      

      fill_in "post[title]", with: "New Title!"
      fill_in "post[body]",  with: "New Body!"
      fill_in "post[tag_list]", with: "ruby, technology"
      click_on "Create Post"

     expect(page).to have_content("New Title!")
     expect(page).to have_content("New Body!")
     expect(page).to have_content("ruby technology")
    end

    it 'they click on a tag and are taken to a new page' do
      post = Post.create!(title: "New Title", body: "New Body")
      tag = post.tags.create!(name: "Name")

      visit post_path(post)
      click_link "#{tag.name}"

      expect(current_path).to eq(tag_path(tag))
      expect(page).to have_link("New Title")
    end
  end
end