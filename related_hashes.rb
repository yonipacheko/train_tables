require 'date'

Time_tables =   [
        { name: 01, start_date: '2014-04-24 22:03:00', start_location: 'A', end_date: '2014-04-24 22:10:00', end_location: 'BC' },
        { name: 05, start_date: '2014-04-24 22:20:00', start_location: 'RI', end_date: '2014-04-24 23:10:00', end_location: 'XX' },
        { name: 06, start_date: '2014-04-24 17:10:00', start_location: 'X', end_date: '2014-04-24 20:10:00', end_location: 'B' },
        { name: 02, start_date: '2014-04-24 17:10:00', start_location: 'Z', end_date: '2014-04-24 20:10:00', end_location: 'B' },
        { name: 04, start_date: '2014-04-24 22:15:00', start_location: 'BC', end_date: '2014-04-24 22:20:00', end_location: 'RI' },
        { name: 03, start_date: '2014-04-24 23:15:00', start_location: 'XX', end_date: '2014-04-24 00:10:00', end_location: 'E' }
      ]

  def finding_one_route(time_tables)


    joined_time_tables = []
    time_tables.sort_by! do |time_table|
      DateTime.parse(time_table[:start_date]).to_time
    end
  #puts time_tables


      0.upto(time_tables.size-1) do |i|
        #'loops ahora'
       middle_hand_container = [time_tables[i]]
        0.upto(i-1) do |j|
          j_end_date = DateTime.parse(joined_time_tables[j][-1][:end_date]).to_time
          i_start_date = DateTime.parse(time_tables[i][:start_date]).to_time
          if j_end_date <= i_start_date
            if joined_time_tables[j][-1][:end_location].eql? time_tables[i][:start_location]
              #if longest[j].size + 1 > long_for_i.size  # shall I check this ?

              middle_hand_container = joined_time_tables[j] + [time_tables[i]]
              #end
            end
          end
        end
         #'longes_arr: '
       joined_time_tables[i] = middle_hand_container
      end
      return joined_time_tables[-1]
  end

  puts finding_one_route(Time_tables)
# My expexpected result will be this:
#   [
#       { name: 01, start_date: '2014-04-24 22:03:00', start_location: 'A', end_date: '2014-04-24 22:10:00', end_location: 'BC' },
#       { name: 06, start_date: '2014-04-24 22:15:00', start_location: 'BC', end_date: '2014-04-24 22:20:00', end_location: 'RI' },
#       { name: 05, start_date: '2014-04-24 22:20:00', start_location: 'RI', end_date: '2014-04-24 23:10:00', end_location: 'XX' },
#       { name: 03, start_date: '2014-04-24 23:15:00', start_location: 'XX', end_date: '2014-04-24 00:10:00', end_location: 'E' }
#   ]




