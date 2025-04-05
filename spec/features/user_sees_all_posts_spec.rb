require "rails_helper"

describe "user sees all articles", type: :feature do
  describe "they visit /articles" do
    it "displays all articles" do
      post_1 = Post.create!(title: "Title 1", body: "Body 1")
      post_2 = Post.create!(title: "Title 2", body: "Body 2")

      visit '/posts'

     expect(page).to have_content(post_1.title)
     expect(page).to have_content(post_2.title)
    end
  end
end