require 'mechanize'

namespace :populate do
  
  desc "Generate fake data for DB"
  task fake: :environment do

    FAKE_COUNT = Settings.fake_records.count
    
    FAKE_COUNT.times do
      
      city = Faker::Address.city
      university = University.create(
        name:        "#{city} University", 
        address:     "#{city}, #{Faker::Address.street_address}",
        coordinates: [ Faker::Address.latitude, Faker::Address.longitude ],
        vote:        rand(100)
      )

      FAKE_COUNT.times do
        faculty = university.faculties.create(
          name: Faker::Lorem.word, 
          vote: rand(100)
        )
        
        FAKE_COUNT.times do 
        
          department = faculty.departments.create(
            name: Faker::Lorem.word, 
            vote: rand(100)
          )

          FAKE_COUNT.times do 
            department.groups.create(
              name: Faker::Lorem.sentence(3), 
              vote: rand(100)
            )

            department.lectors.create(
              name:     Faker::Name.name, 
              position: ['lector', 'director', 'professor'].sample, 
              vote:     rand(100)
            )
          end
        
        end
      
      end
    
    end

  end
end    