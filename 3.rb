## Задача №3:
#
# Джон добрался до этажа с бомбой, но у него на пути стоит дверь с кодовым замком и рядом бумажка с инструкциями (файл data/3.txt)
#
# Чтобы узнать код от замка, ему нужно для каждой строки найти разницу между наибольшим и наименьшим числами и потом сложить полученные значения
#
## Требования к решению:
# - Входные данные находятся в файле data/3.txt (разделитель значений - символ табуляции)
# - Результат должен быть выведен в консоль командой puts
#
## Решение:

array_strings = []


file = File.open("data/3.txt", "r")
file.each {|line| array_strings.push(line)}
file.close()

new_array = []
array_strings.each { |line| new_array.push(line.slice(0, line.size() - 1).split("\t"))}

max_int = 0
min_int = 0
temp_max_int = 0
temp_min_int = 0
result = 0

for subarray in new_array
  temp_max_int = subarray[0].to_i
  temp_min_int = subarray[0].to_i

  for str in subarray
    if str.to_i > temp_max_int
      temp_max_int = str.to_i
    elsif (str.to_i < temp_min_int)
      temp_min_int = str.to_i
    end
  end

  result += temp_max_int - temp_min_int
end

puts result
