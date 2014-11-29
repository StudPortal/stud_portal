require 'mechanize'

namespace :scrape do
  
  desc "Scrape NULP"
  task university: :environment do
    
    UNIVERSITY_URL  = 'http://nuft.edu.ua/page/view'
    mechanize       = Mechanize.new
    university_page = mechanize.get(UNIVERSITY_URL + '/fakultety-ta-kafedry')
    institutes      = university_page.search('table td')

    @university = University.create!(name:'Національний університет харчових технологій')

    institutes.each do |faculty|
      links = faculty.search('a')
      if links.count > 2
        begin
          @faculty = @university.faculties.create!(name: links.first.text)
          puts '- Faculty:'
          puts @faculty.name

          puts '--- departments'
          links[1..-1].each do |department|
            @department  = @faculty.departments.create!(name: department.text)
            puts '----- ' + department.text

            puts '------ lectors'
            lectors_page = mechanize.get(department[:href]).link_with(text: 'Викладацький склад').click
            lectors_page.search('.people-list li').each do |lector| 
              @department.lectors.create!(name: lector.search('.name').text, position: lector.search('.position').text)
              puts '-------- ' + lector.search('.name').text + ' --- ' + lector.search('.position').text
            end

            puts '------ groups'
            
            group_page = mechanize.get(department[:href]).link_with(text: 'Напрями/Спеціальності').click
            group_name = group_page.search('.pageContent p').first.text
            group_name = group_page.search('.pageContent p')[1].text if group_name.exclude?('«')
            
            if group_name.include?('«')
              group_name.slice!(0..group_name.index("«"))
              group_name.slice!(group_name.index("»")..-1)
              puts '-------- ' + group_name

              @department.groups.create!(name: group_name)
            else
              @department.groups.create!(name: @department.name.gsub('Кафедра ',''))
            end
          end
        rescue
          puts '----------------------'
          puts 'ERROR'
          puts '----------------------'
        end
      end
    end

  end
end    