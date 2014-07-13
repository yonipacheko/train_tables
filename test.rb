arr = ['cat', 'dog', 'pony', 'bird', 'tiger', 'lion', 'snake', 'wale']
# @content = 0
# arr.each_with_index do |str, idx|
#   if "#{arr[idx-1]}" == 'dog'
#     puts 'yes'
#     @content+= 1\
#
#
#   else
#     @content+= 1
#   end
#   p @content
# end

# def remove(array, from, to)
#   result = []
#   result << to
#   removing = true
#   array.each do |letter|
#     result << letter unless removing == true
#
#     # if letter == from
#     #   removing = true
#     # end
#     if letter == to
#       removing = false
#     end
#   end
#   puts  result
# end
#
# remove(arr, 'cat', 'bird')
0.upto(arr.size-1) do |j|
  puts arr[j].size
end

