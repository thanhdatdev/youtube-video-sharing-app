class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  enum :kind, { like: 0, dislike: 1 }
end
