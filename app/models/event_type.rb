class EventType < ActiveRecord::Base
  has_many :events

  # Name of EventType must be present when storing to db
  validates_presence_of :name

  # String representation of this object - returns just name of self
  def to_s
    name
  end
end
