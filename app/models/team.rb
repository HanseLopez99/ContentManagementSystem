class Team < ApplicationRecord
  belongs_to :user
  belongs_to :blog
end
