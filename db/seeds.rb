# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event_types = EventType.create([{name: 'Brucka'}])
events = Event.create([{year: 1, event_type_id: event_types.first}, {year: 2, event_type_id: event_types.first}, {year: 3, event_type_id: event_types.first}])
callers = Caller.create([{name: 'Cvjetko', division: 'Torzo'},{name: 'Nikica', division: 'Mammal'},{name: 'Coha', division: 'Pjetao!'},{name: 'Tashner', division: 'Stream'},{name: 'Andro', division: 'Gospar'}])
sponsors = Sponsor.create([{name: 'HP', contact: 'Coha'},{name: 'Shonjo', contact: 'Pipi'},{name: 'Badel', contact: 'Brandy'},{name: 'Clint', contact: 'Eastwood'},{name: 'Star Trek', contact: 'Q'}])
cont = Contribution.create([{:status => 'N'},{:status => 'N'},{:status => 'Y'},{:status => 'Y'},])
e = Event.find(:first)
call = Caller.find(:first)
s = Sponsor.find(:first)
cont = Contribution.find(:first)
e.callers.push(call)
e.sponsors.push(s)
e.save

Contribution.all.each do |c|
  c.update_event_and_sponsor(1,c.id)
end
