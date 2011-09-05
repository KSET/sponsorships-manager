class Event < ActiveRecord::Base

  # Event hase a type assocciated with it
  # event_type_id is a foreign key to EventType model/table that designates the type of an event
  belongs_to :type

  # n to n on Caller model
  has_and_belongs_to_many :callers

  # n to n on Sponsor model
  has_and_belongs_to_many :sponsors

  # Year attr must be present when storing to db
  validates_presence_of :year

  # Year must be unique for this event type, that is we can't 
  # have events multiple events of the same tape in one year
  validates_uniqueness_of :year, :scope => [:event_type_id]

  # Since Event belongs_to an EventType, we can't have a object wrapper call like event.type
  # so we define a type method that fetches a EventType with id stored in this object and
  # return it's string representation (defined in EventType)
  # NOTE: this is a slight hack young ducklings, try to improve this one
  def type
    EventType.find(self.event_type_id).to_s
  end
end
