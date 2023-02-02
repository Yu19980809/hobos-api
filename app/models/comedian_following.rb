class ComedianFollowing < ApplicationRecord
  belongs_to :user
  belongs_to :comedian
end
