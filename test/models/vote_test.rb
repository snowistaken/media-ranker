require "test_helper"

describe Vote do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  describe 'validations' do
    before do
      @vote = Vote.new(user_id: 11111, work_id: 11111)
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
end
