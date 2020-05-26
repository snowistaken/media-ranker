require "test_helper"

describe Work do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  describe 'validations' do
    before do
      @work = Work.new(category: "test category", title: "test work", creator: "author", publication_year: "01-01-2000", description: "test")
    end

    it 'is valid when all fields are present' do
      result = @work.valid?

      expect(result).must_equal true
    end

    it 'is invalid without a category' do
      @work.category = nil

      result = @work.valid?

      expect(result).must_equal false
      expect(@work.errors.messages).must_include :category
    end

    it 'is invalid without a title' do
      @work.title = nil

      result = @work.valid?

      expect(result).must_equal false
      expect(@work.errors.messages).must_include :title
    end

    it 'is invalid without a creator' do
      @work.creator = nil

      result = @work.valid?

      expect(result).must_equal false
      expect(@work.errors.messages).must_include :creator
    end

    it 'is invalid without a publication year' do
      @work.publication_year = nil

      result = @work.valid?

      expect(result).must_equal false
      expect(@work.errors.messages).must_include :publication_year
    end

    it 'remains valid without a description' do
      @work.description = nil

      result = @work.valid?

      expect(result).must_equal true
    end
  end
end
