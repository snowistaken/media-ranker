class Work < ApplicationRecord

  has_many :votes

  def self.spotlight
    works = Work.all
    works.to_a.sort_by!{ |work| work.votes.to_a.length}

    return works[0]
  end

  def self.top_ten(works)
    works.to_a.sort_by!{ |work| work.votes.to_a.length}

    return works[0..9]
  end
end