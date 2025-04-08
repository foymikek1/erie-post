require "rails_helper"

describe "user delete tag", type: :feature do
  describe "they link to the show page and delete tag" do
    it "displays index page with all tags, less deleted" do
      post = Post.create!(title: "New Title", body: "New Body")
      tag_1 = post.tags.create!(name: "Name 1")
      tag_2 = post.tags.create!(name: "Name 2")

      visit tag_path(tag_1)

      click_on "Delete Tag"
      expect(current_path).to eq(tags_path)
      expect(page).to have_content(tag_2.name)
      expect(page).to_not have_content(tag_1.name)
    end
  end
end