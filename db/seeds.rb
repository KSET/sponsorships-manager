# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event_types = EventType.create([{name: 'Brucka'}])
events = Event.create([{year: 1, event_type_id: event_types.first}, {year: 2, event_type_id: event_types.first}, {year: 3, event_type_id: event_types.first}])
callers = Caller.create([{name: 'Cvjetko', division: 'Torzo'}])
callers = Caller.create([{name: 'Nikica', division: 'Mammal'}])
e = Event.find(:first)
c = Caller.find(:first)
e.callers.push(c)
e.save
