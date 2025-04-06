require "rails_helper"

describe "user sees one post", type: :feature do
  describe "they link from visiting /posts" do
    it "display details of selected post" do
      post_1 = Post.create!(title: "Title 1", body: "Body 1")
      comment_1 = post_1.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = post_1.comments.create(author_name: "You", body: "So much to say")

      visit '/posts'
      click_link post_1.title
      expect(current_path).to eq(post_path(post_1))

     expect(page).to have_content(post_1.title)
     expect(page).to have_content(post_1.body)
     expect(page).to have_content(comment_1.author_name)
     expect(page).to have_content(comment_1.body)
     expect(page).to have_content(comment_2.author_name)
     expect(page).to have_content(comment_2.body)     
    end
  end
  describe "they fill in a comment form" do
    it "displays the comment on the post show" do
      post = Post.create!(title: "New Title", body: "New Body")

      visit post_path(post)

      fill_in "comment[author_name]", with: "ME!"
      fill_in "comment[body]", with: "So many thoughts on this post."
      click_on "Submit"

      expect(current_path).to eq(post_path(post))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("ME!")
      expect(page).to have_content("So many thoughts on this post.")
    end
  end

end