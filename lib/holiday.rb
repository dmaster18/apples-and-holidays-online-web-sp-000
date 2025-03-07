require 'pry'

holiday_hash = {
     :winter => {
       :christmas => ["Lights", "Wreath"],
       :new_years => ["Party Hats"]
     },
     :summer => {
       :fourth_of_july => ["Fireworks", "BBQ"]
     },
     :fall => {
       :thanksgiving => ["Turkey"]
     },
     :spring => {
       :memorial_day => ["BBQ"]
     }
   }

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end


def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
  holiday_hash[:winter]
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
  # code here
  # remember to return the updated hash
end

def all_winter_holiday_supplies(holiday_hash)
  collection = []
  holiday_hash.each do |season, season_details|
    if season == :winter
      season_details.each do |holiday, supplies|
          collection << supplies.flatten
      end
    end
  end
  collection.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, season_details|
    puts season.to_s.capitalize + ":"
    season_details.each do |holiday, supplies|
      holiday_proper = holiday.to_s.gsub("_", " ").split(" ")
      holiday_proper_final = []
      holiday_proper.each do |word|
        new_word = word.capitalize
        holiday_proper_final << new_word
      end
      holiday_string = holiday_proper_final.join(" ")
      if holiday == season_details.values.last
        print "  " + holiday_string + ": " + "\n"
      else 
        print "  " + holiday_string + ": "
      end
      supplies.each do |supply|
         if supply == supplies.last
           print supply.to_s + "\n"
         else
           print supply.to_s + ", "
         end
      end
    end
  end
end

all_supplies_in_holidays(holiday_hash)

def all_holidays_with_bbq(holiday_hash)
  holiday_name_array = []
  holiday_hash.each do |season, seasonal_data|
    seasonal_data.each do |holiday, supplies|
      if supplies.include?("BBQ")
        holiday_name_array << holiday
      end
    end
  end
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_name_array
end







