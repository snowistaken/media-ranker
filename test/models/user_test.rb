require "test_helper"

describe User do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  describe 'validations' do
    before do
      @user = User.new(username: "testuser")
      @invalid_user = User.new(username: "testuser")
    end

    it 'is valid when all fields are present' do
      result = @user.valid?

      expect(result).must_equal true
    end

    it 'is invalid without a username' do
      @user.username = nil

      result = @user.valid?

      expect(result).must_equal false
      expect(@user.errors.messages).must_include :username
    end
  end

  # describe 'relations' do
  #   before do
  #     @user = User.new(username: "test user")

  #     5.times do |i|
  #       Vote.new(user_id: @user.id, work_id: i)
  #     end
  #   end

  #   it 'can get a list of all votes belonging to a user' do

  #     votes = @user.votes

  #     expect((votes).nil?).must_equal false
  #     expect(votes.length).must_equal 5
  #   end
  # end
end
