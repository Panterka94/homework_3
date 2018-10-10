# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются
# при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает
# количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только
# на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

load 'Route.rb'

class Train
  attr_reader :number_of_carriages, :train_speed, :train_type, :train_number

  def initialize(train_number, train_type, number_of_carriages)
    @train_number = train_number
    @train_type = train_type
    @number_of_carriages = number_of_carriages
    @train_speed = 0
  end

  # Увеличиваем скорость
  def increase_speed(speed)
    @train_speed += speed
  end

  # Сбрасывает скорость до 0
  def stop_train
    @train_speed = 0
  end

  # отцепить вагон
  def unhook_carriage
    raise "The number of carriages can not be less than 0" if (@number_of_carriages - 1 < 0)
    raise "The train is moving" if (@train_speed != 0)
    @number_of_carriages -= 1
  end

  # Прицепить вагон
  def hook_carriage
    raise "The train is moving" if @train_speed != 0
    @number_of_carriages += 1
  end

  # Сеттер для маршрута и автоматически устанавливает поезд на первую станцию маршрута
  def route=(route)
    @route = route
    @current_station = 0
  end

  # Перемещаем поезд вперед по иаршруту
  def move_train_forward
    raise "We are already at the final station" if @current_station == @route.station_list.size - 1
    @current_station += 1
  end

  # Перемещаем поезд по маршруту назад
  def move_train_backward
    raise "We are already at the first station" if @current_station == 0
    @current_station -= 1
  end

  # Выводим информацию по маршруту
  def train_route_info
    if @current_station == 0
      puts "previous station: no previous station"
    else
      puts "previous station: #{@route.station_list[@current_station - 1]}"
    end

    puts "current_station: #{@route.station_list[@current_station]}"

    if @current_station == @route.station_list.size - 1
      puts "next station: no next station"
    else
      puts "next station: #{@route.station_list[@current_station + 1]}"
    end
  end
end

#my_train = Train.new("i76fu5d", "passenger", 5)
#my_train.increase_speed(7)
#puts my_train.train_speed
#my_train.stop_train
#puts my_train.train_speed
#my_train.unhook_carriage
#puts my_train.number_of_carriages
#my_train.hook_carriage
#puts my_train.number_of_carriages

#my_route = Route.new("initial_station", "final_station")
#my_route.add_intermediate_station("123")
#my_route.add_intermediate_station("456")

#my_train.route = my_route
#my_train.train_route_info
#my_train.move_train_forward
#my_train.train_route_info
#my_train.move_train_forward
#my_train.train_route_info
