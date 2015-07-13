# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{email: 'admin@overflowed.com', password: 'admin', password_confirmation: 'admin', username: 'admin', image: 'http://static1.squarespace.com/static/51c946cde4b0f05142538988/5278a958e4b085eb5a855185/556d1d01e4b0985a8058ac2f/1433259154353/?format=1500w', cycle_length: 11, preference: 'Tampons', bio: 'I started my period when I was 7. It has been a good time since then. I also love cats. We are all on the same cycle, which is pretty nice. Make that REALLY NICE! I love cat periods!', admin: true }])

categories = Category.create([{name: 'Cycle Length'}, {name: 'Birth Control'}, {name: 'Health Care'}, {name: 'Education'}, {name: 'General Knowledge'}, {name: 'Symptoms'}, {name: 'Illness'}, {name: 'Personal Stories/Inquiries'}, {name: 'Menstruation Apparatus'}, {name: 'Hormones'}, {name: 'Toxic Shock Syndrome (TSS)'}, {name: 'Pre Menstrual Symptoms (PMS)'}, {name: 'Puberty'}])
