require "rails_helper"

describe "user sees all posts", type: :feature do
  describe "they visit /posts" do
    it "displays all posts" do
      post_1 = Post.create!(title: "Title 1", body: "Body 1")
      post_2 = Post.create!(title: "Title 2", body: "Body 2")

      visit '/posts'

     expect(page).to have_link(post_1.title)
     expect(page).to have_link(post_2.title)
     expect(page).to have_link("Create a New Post")
    end
  end
end