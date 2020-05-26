require "test_helper"

describe Vote do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  describe 'validations' do
    before do
      @vote = Vote.new(user_id: 1, work_id: 1)
    end

    it 'is valid when all fields are present' do
      result = @vote.valid?

      expect(result).must_equal true
    end

    it 'is invalid without a user id' do
      @vote.user_id = nil

      result = @vote.valid?

      expect(result).must_equal false
      expect(@vote.errors.messages).must_include :user_id
    end

    it 'is invalid without a work id' do
      @vote.work_id = nil

      result = @vote.valid?

      expect(result).must_equal false
      expect(@vote.errors.messages).must_include :work_id
    end
  end

  describe 'relations' do
    it 'can set the user through "user"' do
      user = User.create!(username: "test user")
      vote = Vote.new(work_id: 1111)

      vote.user = user

      expect(vote.user_id).must_equal user.id
    end

    it 'can set the user through "user_id"' do
      user = User.create!(username: "test user")
      vote = Vote.new(work_id: 1111)

      vote.user_id = user.id

      expect(vote.user_id).must_equal user.id
    end
  end
end
