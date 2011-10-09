class Caller < ActiveRecord::Base

  has_and_belongs_to_many :events

  validates_presence_of :name

  #method to concat name with division 
  #and return that value.
  def name_and_division
    return self.name+"->"+self.division
  end
end
