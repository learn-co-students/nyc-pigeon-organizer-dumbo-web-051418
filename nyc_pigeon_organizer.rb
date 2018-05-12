def nyc_pigeon_organizer(data)
  # write your code here!
  
  def get_details_per_pigeon(name, attribute, hash)
    hash[attribute].map do |key, value|
      value.map do |array|
        if array.include?(name)
          key
        end 
      end 
    end.flatten.uniq.compact
  end 

  def get_pigeon_names(hash)
    hash.map do |attribute, details|
      details.map do |key, value|
        value
      end 
    end.flatten.uniq
  end 

  def get_attributes(hash)
    hash.map do |attribute, details|
      attribute
    end 
  end 

  def new_hash(old_hash)
    org_pigeon_hash = Hash.new
    attributes = get_attributes(old_hash)
    names = get_pigeon_names(old_hash)
    
    #add names to new hash as 1st lvl keys
    i = 0 
    while i < names.length do 
      org_pigeon_hash[names[i]] = {}
      i+=1
    end 
    #add attributes to new hash as 2nd lvl keys
    attributes.map do |attribute|
      names.map do |name|
        org_pigeon_hash[name][attribute] = []
      end 
    end 
    #add details to new hash as 3rd lvl elements in an array
    names.each do |name|
      attributes.each do |attribute|
        get_details_per_pigeon(name,attribute,old_hash).each do |element|
          org_pigeon_hash[name][attribute] << element.to_s
        end 
      end 
    end 
    org_pigeon_hash
  end 
    new_hash(data)
end