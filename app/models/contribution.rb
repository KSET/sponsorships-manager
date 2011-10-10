class Contribution < ActiveRecord::Base
  belongs_to :sponsor
  belongs_to :event
  
  validates_presence_of :event_id
  validates_presence_of :sponsor_id
  
  def update_event_and_sponsor(event_id, sponsor_id)
    self.event_id = event_id
    self.sponsor_id = sponsor_id
    self.save
  end
end
