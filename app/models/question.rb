class Question < ApplicationRecord
  acts_as_votable
  has_many :answers
  belongs_to :user
end
