User.destroy_all
Participant.destroy_all
PersonalEvent.destroy_all
Contact.destroy_all
CommunityEvent.destroy_all

puts "seeding started..."
User.create(email: "host@gmail", username: "tester", password: "test123", image: "https://image-cdn.essentiallysports.com/wp-content/uploads/Hulk-Hogan-2.png", alias: "tester", pronoun: "he")
User.create(email: "something@gmail", username: "abc123", password: "abc123", image: "https://image-cdn.essentiallysports.com/wp-content/uploads/Hulk-Hogan-2.png", alias: "chicken", pronoun: "he")
User.create(email: "porkytest@gmail", username: "test", password: "porky", image: "https://image-cdn.essentiallysports.com/wp-content/uploads/Hulk-Hogan-2.png", alias: "port", pronoun: "she")
PersonalEvent.create(user_id: 1,title: "start", start: "2022-10-08", end: "2022-10-09")
PersonalEvent.create(user_id: 2,title: "wooooooo", start: "2022-10-31", end: "2022-11-01")
PersonalEvent.create(user_id: 3,title: "do something", start: "2022-10-20", end: "2022-10-21")
Contact.create(user_id: 1, email: "antonio@gmail.com", first_name: "antonio", last_name: "bruh", company: "flatiron", phone_number: 7182224244, location: "New York", notes: "this place fuckin sucks")
Contact.create(user_id: 2, email: "shane@gmail.com", first_name: "shane", last_name: "bruv", company: "google", phone_number: 7183334244, location: "New York", notes: "i love this place so much")
Contact.create(user_id: 3,email: "karl@gmail.com", first_name: "karl", last_name: "stinky", company: "facebook", phone_number: 7188873333, location: "New York", notes: "what can i even say??")
CommunityEvent.create!(user_id: 1, max_participant: 20, min_participant: 1, title: "chicken-heads", start: "Wed Oct 26 2022 00:00:00 GMT-0400 (Eastern Daylight Time)", end: "Fri Oct 28 2022 00:00:00 GMT-0400 (Eastern Daylight Time)")
Participant.create(user_id: 2, community_event_id: 1)
Participant.create(user_id: 3, community_event_id: 1)
puts "done SEEDING!"