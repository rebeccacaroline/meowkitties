class Contributor < ActiveRecord::Base
  has_many :contributions
  has_many :politicians, through: :contributions

  validates :name, uniqueness: true
end
