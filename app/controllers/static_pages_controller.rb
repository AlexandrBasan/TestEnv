class StaticPagesController < ApplicationController
  def home

    # Read all files from a folder
    files = Dir.glob("#{Rails.root}/tmp/files/*")
    # create main storage for read file
    @all_data = []
    # Take every file and process each
    files.each do |file|
      # open each file and take all file content
      File.open(file, "r").each_line do |line|
        # create new array which will have data from particular file (in this case it is programm data)
        file_data = []
        lines_array = line.split("\r")
        # Read each line in file (line by line)

        # split array buy days using new line as a devider
        lines_array.split { |i| i == "" }.each do |day|
          name_of_the_day = nil
          # take each day and try to find important information about it
          day.each_with_index do |item, index|
            # this REGEX match day name like # PART 1 - DAY 2 - LEGS & ABS
            if item.match(/PART(.*)-/)
              # we create name for the day like # ["PART 1 - DAY 1 - WHOLE BODY", "PART 1", "DAY 1", "WHOLE BODY"]
              name_of_the_day = item.split('-').unshift(item).map {|x| x.strip}
            end
          end

          if name_of_the_day.present?
            # Day description
            # we delete name like # PART 1 - DAY 2 - LEGS & ABS from day description
            ex_types = day.delete_if {|x| x == name_of_the_day[0] }
            # we get position of element which are devide day buy exsersises in our case it is "REPEAT ROUTINE 3X" also we add blank array element to devide day by exsersises easier
            ex_types.each_index.select{|i| ex_types[i].match(/REPEAT ROUTINE(.*)/)}.each_with_index {|ei, eindex| ex_types.insert(ei+eindex+1,"") }
            # we split day by exsersises type and delete empty elements
            ex_types = ex_types.split { |i| i == "" }.reject { |c| c.empty? }

            # all day's exsersises should be saved in this array
            all_exsersises = []
            # we are trying to build propper json
            ex_types.each do |ex_type|
              # each exsersise round or type will be sitting here
              exsersise_type_json = {}
              ex_type.each_with_index do |exsersise_type, index|
                # Save exsersise name
                if index == 0
                  exsersise_type_json[:name] = exsersise_type
                  ex_type.delete_if {|x| x == exsersise_type }
                end
                # Get URL
                # if exsersise_type.match(/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/)
                #   exsersise_type_json[:url] = exsersise_type
                #   ex_type.delete_if {|x| x == exsersise_type }
                # end
                # Save repeat times
                if exsersise_type.match(/REPEAT ROUTINE(.*)/)
                  exsersise_type_json[:repeat] = exsersise_type
                  ex_type.delete_if {|x| x == exsersise_type }
                end

              end
              # Assign this ROUND to JSON
              exsersise_type_json[:exsersises] = ex_type
              # Assign all exsersises to array
              all_exsersises << exsersise_type_json
            end
            # save data
            file_data << {full_name: name_of_the_day[0] , part: name_of_the_day[1], day: name_of_the_day[2], ex_type: name_of_the_day[3], ex_types: all_exsersises}
          else
            # General program description
            file_data << {programm_name: day[0], programm_link: day[1]}
          end
        end

        #ap "*"*100
        @all_data << file_data
      end
    end

    #ap @all_data
  end

  def help
  end

  def website
  end

  def data
    respond_to do |format|
      format.html {  }
      format.js
    end
  end
end
