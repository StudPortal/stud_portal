module VotesCalculation
  extend ActiveSupport::Concern

  def up_vote
    update! vote: vote+1
    self
  end

  def down_vote
    update! vote: vote-1
    self
  end

end