User.destroy_all
Game.destroy_all
Attendance.destroy_all
Event.destroy_all
UserGame.destroy_all

sports = [
        ["Basketball", "https://media.istockphoto.com/photos/basketball-picture-id959080376?k=6&m=959080376&s=612x612&w=0&h=BgZIZABPts_kaCbe7jrZA5T9OrXXgNd9MgyN9bRir6U="], 
        ["Lacrosse", "https://static9.depositphotos.com/1647866/1125/i/450/depositphotos_11257926-stock-photo-lacrosse.jpg"], 
        ["Curling", "https://ak3.picdn.net/shutterstock/videos/8730883/thumb/1.jpg"], 
        ["Chess", "https://media.istockphoto.com/photos/hand-moving-the-king-in-chess-game-picture-id511117530?k=6&m=511117530&s=612x612&w=0&h=JgNA-_PQnVY3g2wKItN1jUoLjmtIKoq8eq2_VB79XxM="], 
        ["Pokemon", "https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/07/20/09/pokemon-go-uk-getty.jpg?w968h681"], 
        ["Cricket", "https://media.istockphoto.com/photos/side-view-of-cricket-player-batting-while-playing-on-field-picture-id846032464?k=6&m=846032464&s=612x612&w=0&h=5EfGVt3SsTg2tDYnlqDfcA6MUpuYQaCsG0K4BEKP3gY="], 
        ["Taekwondo", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR7lHSZOByx4COe0KwN9GZZIFhQ4BwN9-6HLsxm9GwU4KIToIjA"], 
        ["Wrestling", "https://media.istockphoto.com/photos/wrestlers-wrestling-picture-id503072204?k=6&m=503072204&s=612x612&w=0&h=q3FCGbkph8P35uSAFselgAeNICKqUJBWpJnf1ICSQM4="], 
        ["Super Smash Bros Melee", "https://static-cdn.jtvnw.net/ttv-boxart/Super%20Smash%20Bros.%20Melee.jpg"], 
        ["Soccer", "https://ak6.picdn.net/shutterstock/videos/11951456/thumb/1.jpg"], 
        ["Baseball", "https://images.squarespace-cdn.com/content/54905286e4b050812345644c/1462979371952-6RXCWWL1PQJKNPAUIJUV/Baseball-stock-photo-3.jpg?format=1500w&content-type=image%2Fjpeg"], 
        ["Hockey", "https://www.vmcdn.ca/f/files/thoroldnews/images/sports/hockey-stock.jpg;w=960"], 
        ["Football", "https://image1.masterfile.com/getImage/NjE0LTA1NzkyNTQzZW4uMDAwMDAwMDA=AIqm88/614-05792543en_Masterfile.jpg"], 
        ["Tennis", "https://images.freeimages.com/images/large-previews/cd8/tennis-fun-2-1398396.jpg"], 
        ["Judo", "https://media.istockphoto.com/photos/judo-training-in-the-sports-hall-picture-id621819278?k=6&m=621819278&s=612x612&w=0&h=VSKpyk8cPqX36_gzqbsnFQEf0u9vVtRLeEEUajBA004="], 
        ["Volleyball", "https://media.istockphoto.com/photos/high-school-volleyball-match-in-gymnasium-picture-id498130725?k=6&m=498130725&s=612x612&w=0&h=lfijJKR9tPnXbh-HnSyThquQvz8dO-Sg7ZYOK_KorCU="], 
        ["Rugby", "https://www.talkingrugbyunion.co.uk/images/e-005689/simon.jpg"], 
        ["Golf", "https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/07/11/11/golf4.jpg"], 
        ["Super Smash Bros Ultimate", "https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_SuperSmashBrosUltimate_02_image1600w.jpg"], 
        ["Halo", "https://cdn.wccftech.com/wp-content/uploads/2019/03/WCCFhalo3.jpg"]
    ]

sports.each do |sport|
    Game.create(name: sport[0], img_src: sport[1])
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