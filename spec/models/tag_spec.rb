require 'rails_helper'

describe Tag, type: :model do
  describe "relationships" do
    it {should have_many(:taggings)}
    it {should have_many(:posts).through(:taggings)}
  end
end