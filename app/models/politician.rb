class Politician < ActiveRecord::Base
  has_many :contributors through :contributions
end
