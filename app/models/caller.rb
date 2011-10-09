class Caller < ActiveRecord::Base

  has_and_belongs_to_many :events

  validates_presence_of :name

  def caller_id
    #Caller.find(self.id).to_s
    "2"#"caller_id"
  end
end
