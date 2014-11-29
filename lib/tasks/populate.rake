require 'mechanize'

namespace :populate do
  
  desc "Scrape NULP"
  task fake: :environment do

    100.times do

      city = Faker::Address.city
      university = University.create(name: "#{city} University", adress: "#{city}, #{Faker::Address.street_address}")

      10.times do 

        faculty = university.faculties.create(name: Faker::Lorem.word)

        10.times do 
        
          department = faculty.departments.create(name: Faker::Lorem.word)

          10.times do 
        
            department.groups.create(name: Faker::Lorem.sentence(3))
        
            department.lectors.create(name: Faker::Name.name, position: ['lector', 'director', 'professor'].sample)
          end
        
        end

      end

    end

  end
end    