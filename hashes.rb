Time_tables =   [
    { name: '01251'},
    { name: '05012'},
    { name: '03232'},
    { name: '02435'},
    { name: '04545'},
    { name: '03545'}
]


def finding_numbers(tables, train_number)
  tables.each do |i|
    if i[:name] == train_number
      p i
    end
  end
 # p @referenced_point

end

finding_numbers(Time_tables, '02435' )


