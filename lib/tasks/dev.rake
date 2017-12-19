namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours:  FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
        )
    end
    puts "have created fake restaurants"
    puts "now you ahve #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    20.times do |i|
      User.create!(
        email: "#{FFaker::Name.first_name}@example.com",
        password: "12345678")
    end
    puts "have created 20 fake users"
  end

  task fake_comment: :environment do
    Comment.destroy_all
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
          )
      end
    end
    puts "have creatd 3 fake comments for each restaurant"
  end
end
