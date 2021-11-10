## Задача №4:
#
# В соседнем районе рождественские эльфы готовят подарки для жителей города.
# Для каждого подарка (файл data/4.txt) нужно найти сколько оберточной бумаги потребуется.
# Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
# Например, на подарок размером 2х3х4 требуется 2*6 + 2*12 + 2*8 = 52 + 6 кв. см.
#
# Сколько всего оберточной бумаги нужно купить эльфам?
#
## Требования к решению:
# - Входные данные находятся в файле data/4.txt
# - В значениях данные длины, ширины и высоты не упорядочены и могут идти в любом порядке, однако
# длина всегда наименьшее число из трех, высота - среднее, ширина - самое большое.
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:
array_sizes = []

widht = 0
len = 0
height = 0

file = File.open("data/4.txt", "r")
file.each {|line| array_sizes.push(line.slice(0, line.size - 1).split("x"))}
file.close()

array_ascending = []
temp = 0

#упорядочим массив, поставив размеры в порядке возрастания. по индексу: 0 – длина, 1 – высота, 2 – ширина
for subarray in array_sizes
  for i in (0..subarray.size() - 2)
    for j in (1..subarray.size() - 1)
      if subarray[j].to_i <= subarray[i].to_i
        temp = subarray[j]
        subarray[j] = subarray[i]
        subarray[i] = temp
      end
    end
  end
  print "\n\n"
end

#определим площадь наименьшей стороны, длину, ширину высоту
square = 0

for array in array_sizes
  height = array[0]
  len = array[1]
  width = array[2]
  square +=2*width.to_i*len.to_i + 2*len.to_i*height.to_i + 2*height.to_i*width.to_i + height.to_i*len.to_i
end

puts square
