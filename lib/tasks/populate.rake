require 'mechanize'

namespace :populate do
  
  desc "Generate fake data for DB"
  task fake: :environment do

    FAKE_COUNT = 20

    print '\n'
    
    FAKE_COUNT.times do
      
      city = Faker::Address.city
      university = University.create(
        name:        "#{city} University", 
        address:     "#{city}, #{Faker::Address.street_address}",
        coordinates: [ Faker::Address.latitude, Faker::Address.longitude ]
      )
      print 'U'

      FAKE_COUNT.times do
        faculty = university.faculties.create(name: Faker::Lorem.word)
        print 'f'
        FAKE_COUNT.times do 
          department = faculty.departments.create(name: Faker::Lorem.word)
          print 'd'
          FAKE_COUNT.times do 
            department.groups.create(name: Faker::Lorem.sentence(3))
            print 'g'
            department.lectors.create(name: Faker::Name.name, position: ['lector', 'director', 'professor'].sample)
            print 'l'
          end
        
        end
      
      end
    
    end
    
    print '\n'

  end
end    