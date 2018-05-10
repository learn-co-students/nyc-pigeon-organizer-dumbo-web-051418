def nyc_pigeon_organizer(data)
  pigeon_list = {}
  data.each do |trait, value|
    value.each do |key, birds|
      birds.each do |bird|
        pigeon_list[bird] = {}
      end
    end
  end
  
  pigeon_list.collect do |bird, attributes|
    data.each do |trait, value|
      pigeon_list[bird][trait] = []
    end
  end
  
  pigeon_list.collect do |bird, attributes|
    attributes.collect do |attribute, list|  
      data.collect do |trait, value|
        if trait == attribute
          value.collect do |key, birds|
            if birds.include?(bird)
              pigeon_list[bird][trait] << key.to_s
            end
          end
        end
      end
    end
  end
  pigeon_list
end