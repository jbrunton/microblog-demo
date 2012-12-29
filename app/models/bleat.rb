class Bleat < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
  
  has_many :hash_tags

  validates :content, :presence => true
  
  before_save :build_index

  def build_index
    self.hash_tags.clear

    self.content.scan(/#[A-Za-z0-9]+/) do |tag|
      self.hash_tags.build :tag => tag.downcase
    end
  end

  def owned_by?(user)
    !user.nil? && user.id == self.user.try(:id)
  end

  extend TireHelper
  if use_tire?
    include Tire::Model::Search
    include Tire::Model::Callbacks
  end
end
