require 'rails_helper'

RSpec.describe Comment, type: :model do
  #describe 'validations' do
  #  it { should validate_presence_of :}
  #end

  describe 'relationships' do
    it {should belong_to :post}
    #xit {should have_many :}
  end
end