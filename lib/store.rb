class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates_presence_of(:name)
end
