class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_validation(:capitalize)
  validates(:name, uniqueness: {message: "Name already taken"})
  validates_presence_of(:name)

private

  def capitalize
    self.name = name.split.each{|w| w.capitalize!}.join(" ")
  end
end
