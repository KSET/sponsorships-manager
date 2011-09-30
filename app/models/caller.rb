class Caller < ActiveRecord::Base

  has_and_belongs_to_many :events

  validates_presence_of :name

end
