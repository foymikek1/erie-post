require "rails_helper"

describe "user sees one post", type: :feature do
  describe "they link from visiting /posts" do
    it "display details of selected post" do
      post_1 = Post.create!(title: "Title 1", body: "Body 1")

      visit '/posts'
      click_link post_1.title
      expect(current_path).to eq(post_path(post_1))

     expect(page).to have_content(post_1.title)
     expect(page).to have_content(post_1.body)
    end
  end
end