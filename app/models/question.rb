class Question < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: {message: "must be present"}

  scope :recent_ten, -> { order("created_at").limit(10)} #like the def
  scope :recent, lambda {|x| order("created_at DESC").limit(x)} #takes an argument

  #default_scope order("title ASC") #this will run on ALL Queries

  #get the newest 10
  # def self.recent_ten
  #   order("created_at DESC").limit(10)
  # end

end
