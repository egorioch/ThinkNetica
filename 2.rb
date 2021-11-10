## Задача №2:
#
# Ганс Грубер в это время пытается намайнить биткоины - чтобы сделать это ему нужно найти MD5 хэши,
# которые начинаются как минимум с 5 нулей.
# Значение, хэш которого нужно посчитать - это инпут (пользовательский ввод), за которым следует положительное число (1, 2, 3 итд).
#
# Например, для инпута abcdef результатом будет число 609043, потому что MD5 хэш для abcdef609043 начинается с 5 нулей (000001dbbfa...)
# и это минимальное такое число.
#
# Помогите Гансу найти это число.
#
# Требования к решению:
# - Инпут вводится пользователем (получение данных в коде через команду gets)
# - Результат (число) выводится через puts
#
#
## Решение:

require 'digest'

presumably_md5 = Digest::MD5.new
user_input = gets.chomp
incr = -1

presumably_md5.update(user_input)
string_md5 = presumably_md5.to_s
substring = string_md5.slice(0, 5);

while not substring.include?('00000') do
  presumably_md5 = Digest::MD5.new
  incr += 1
  temp_string = user_input + incr.to_s
  presumably_md5.update(temp_string)
  string_md5 = presumably_md5.to_s
  substring = string_md5.slice(0, 5);
end

puts incr
