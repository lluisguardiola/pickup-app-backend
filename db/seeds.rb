User.destroy_all
Game.destroy_all
Attendance.destroy_all
Event.destroy_all
UserGame.destroy_all

sports = ["Basketball", "Lacrosse", "Curling", "Chess", "Pokemon", "Cricket", "Taekwondo", "Wrestling", "Super Smash Bros Melee", "Soccer", "Baseball", "Hockey", "Football", "Tennis", "Judo", "Volleyball", "Rugby", "Golf", "Super Smash Bros Ultimate", "Halo"]

sports.each do |sport|
    Game.create(name: sport)
end

10.times do
    user = User.create(
        username: Faker::Games::SuperSmashBros.fighter.delete(' '),
        password: "hello",
        name: Faker::JapaneseMedia::DragonBall.character,
        age: (13..80).to_a.sample,
        city: "Chicago, IL"
    )

    (2..4).to_a.sample.times do
        UserGame.create(user_id: user.id, game_id: Game.all.sample.id)
    end

    2.times do 
        event = Event.create(
            user_id: user.id, 
            title: Faker::Lorem.sentence(word_count: 4, random_words_to_add: 3),
            description: Faker::Lorem.paragraph(sentence_count: 1, random_sentences_to_add: 4),
            address: Faker::Address.street_address,
            game_id: Game.all.sample.id,
            time: (Time.now + rand(15552000)).strftime('%H:%M'),
            date: (Time.now + rand(15552000)).strftime('%m/%d/%Y')
        )

        (3..7).to_a.sample.times do
            Attendance.create(
                event_id: event.id,
                user_id: User.all.sample.id
            )
        end
    end
end