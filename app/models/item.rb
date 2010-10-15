class Item < ActiveRecord::Base
  validates :name, :presence => true
  validates :price, :numericality => true
  belongs_to :list
end
