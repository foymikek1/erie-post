require "rails_helper"

describe "user sees all tags", type: :feature do
  describe "they visit /tags" do
    it "displays all tags" do
      post = Post.create!(title: "New Title", body: "New Body")
      tag_1 = post.tags.create!(name: "Tag 1")
      tag_2 = post.tags.create!(name: "Tag 2")

      visit tags_path
      expect(page).to have_link(tag_1.name)
      expect(page).to have_link(tag_2.name)
    end
  end
end