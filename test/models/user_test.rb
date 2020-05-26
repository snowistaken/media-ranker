require "test_helper"

describe User do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  describe 'validations' do
    before do
      @user = User.new(username: "testuser")
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
end
