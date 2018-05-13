require 'pry'


def nyc_pigeon_organizer(data)
  pigeon_info = Hash.new
  data.each do |symbol, hash|
    hash.each do |val, arr|
      arr.each do |pidge_name|
      if !pigeon_info.include?(pidge_name)
          pigeon_info[pidge_name] = {symbol => [val.to_s]}
      elsif pigeon_info[pidge_name].include?(symbol)
          pigeon_info[pidge_name][symbol] << val.to_s
      else
          pigeon_info[pidge_name][symbol] = [val.to_s]
        end
      end
    end
  end
  pigeon_info
end
