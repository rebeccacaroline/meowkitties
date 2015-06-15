class Contributor < ActiveRecord::Base
  has_many :politicians through :contributions
end
