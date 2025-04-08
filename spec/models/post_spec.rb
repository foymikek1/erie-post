require "rails_helper"

describe Post, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}

    it {should have_many(:taggings)}
    it {should have_many(:comments)}
    it {should have_many(:tags).through(:taggings)}
  end
end

describe "instance methods" do
    describe "#tag_list" do
      it "turns associated tags into a string" do
        post = Post.create(title: "Tall Tables", body: "They are tough for the short legged")
        post.tags.create(name: "furniture")
        post.tags.create(name: "opinions")

        expect(post.tag_list).to eq("furniture, opinions")
      end
    end
  end