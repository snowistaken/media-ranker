class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :category, presence: true
  validates :publication_year, presence: true
  validates :creator, presence: true
  has_many :votes

  def self.spotlight
    all_works = Work.all
    result = all_works.sort_by { |work| work.votes.length }.reverse

    return result.slice(0)
  end

  def self.top_ten(works)
    result = works.sort_by { |work| work.votes.length }.reverse

    return result.slice(0, 10)
  end

  def self.upvoted?(user_id, work_id)
    if Vote.find_by(user_id: user_id, work_id: work_id)
      return true
    else
      return false
    end
  end

  def self.sort_by_category(category)
    works = Work.where(category: category)
    
    return works.sort_by { |work| work.votes.length }.reverse
  end

end