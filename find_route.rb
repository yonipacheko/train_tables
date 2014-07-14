require 'date'
# I have a couple time_tables in this array.
# There are four time_tables that are related to each other in a linear way by their start_location - end_location and start_date - end_date.
#When the first time_table ends, the other time_table starts, and so on.

# I want basically to list next schedules (time_tables) from a given train-number. By entering the train number,
# and comparing the end_location with other start_location that share same name and a later date_time.
# From there start looking for the rest of its linear route, the train will get different schedules a long the way)
# The linear data to play with is the train's start- and end-date and its start- and end-location



Time_tables =   [
    { name: '01251', start_date: '2014-04-24 22:03:00', start_location: 'A', end_date: '2014-04-24 22:10:00', end_location: 'BC' },
    { name: '05012', start_date: '2014-04-24 22:20:00', start_location: 'RI', end_date: '2014-04-24 23:10:00', end_location: 'XX' },
    { name: '03232', start_date: '2014-04-24 17:10:00', start_location: 'X', end_date: '2014-04-24 20:10:00', end_location: 'B' },
    { name: '02435', start_date: '2014-04-24 17:10:00', start_location: 'Z', end_date: '2014-04-24 20:10:00', end_location: 'B' },
    { name: '04545', start_date: '2014-04-24 22:15:00', start_location: 'BC', end_date: '2014-04-24 22:20:00', end_location: 'RI' },
    { name: '03545', start_date: '2014-04-24 23:15:00', start_location: 'XX', end_date: '2014-04-25 00:10:00', end_location: 'E' }
]


def finding_next_stops(time_tables, train_number)
  #variables:
  @referenced_point
  joined_time_tables = []

  time_tables.sort_by! do |time_table|
    DateTime.parse(time_table[:start_date]).to_time
  end

  #looking for the given time_table
  time_tables.each  do |i|
    if i[:name] == train_number
      @referenced_point = i
    end
  end

  #adding the time_table to the container and then starting the search from this item

  0.upto(time_tables.size-1) do |i|
    #If it's empty I wanna start with the referenced_point(this time_table)
    if joined_time_tables.empty?
      p  'gets in once!'
      middle_hand_container = @referenced_point
    else
      middle_hand_container = [time_tables[i]]
    end


    0.upto(i-1) do |j|
      p j_end_date = joined_time_tables[j][-1][:end_date]

      i_start_date = time_tables[i][:start_date]
      if j_end_date <= i_start_date
        if joined_time_tables[j][-1][:end_location].eql? time_tables[i][:start_location]
          #if longest[j].size + 1 > long_for_i.size  # shall I check this ?

          middle_hand_container = joined_time_tables[j] + [time_tables[i]]
          #end
        end
      end
    end
    joined_time_tables[i] = middle_hand_container
  end
  return joined_time_tables[-1]
end


finding_next_stops(Time_tables, '05012')

#if I enter this: '05012'- train_number I should get:
#{ name: '05012', start_date: '2014-04-24 22:20:00', start_location: 'RI', end_date: '2014-04-24 23:10:00', end_location: 'XX' },
#{ name: '03545', start_date: '2014-04-24 23:15:00', start_location: 'XX', end_date: '2014-04-24 00:10:00', end_location: 'E' }
#if I enter this: '04545' train_number I should get:
# { name: '04545', start_date: '2014-04-24 22:15:00', start_location: 'BC', end_date: '2014-04-24 22:20:00', end_location: 'RI' },
# { name: '05012', start_date: '2014-04-24 22:20:00', start_location: 'RI', end_date: '2014-04-24 23:10:00', end_location: 'XX' },
# { name: '03545', start_date: '2014-04-24 23:15:00', start_location: 'XX', end_date: '2014-04-25 00:10:00', end_location: 'E' }
#
#

