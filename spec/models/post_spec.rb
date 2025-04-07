require "rails_helper"

describe Post, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}

    it {should have_many(:comments)}
  end
end