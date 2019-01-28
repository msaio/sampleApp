class Game < ApplicationRecord
	has_many :minigames
  validates :name, length:{minimum: 1}, presence: true
  validates :pub, length:{minimum: 1}, presence: true
end
