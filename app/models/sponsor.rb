class Sponsor < ActiveRecord::Base
  has_and_belongs_to_many :callers
  has_and_belongs_to_many :events
end
