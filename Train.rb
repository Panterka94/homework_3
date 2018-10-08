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

class Train
  attr_reader :number_of_carriages, :train_speed

  def initialize(train_number, train_type, number_of_carriages)
    @train_number = train_number
    @train_type = train_type
    @number_of_carriages = number_of_carriages
    @train_speed = 0
  end

  def increase_speed(speed)
    @train_speed += speed
  end

  def stop_train
    @train_speed = 0
  end

  # отцепить вагон
  def unhook_carriage
    if @number_of_carriages - 1 < 0
      raise "The number of carriages can not be less than 0"
    end
    @number_of_carriages -= 1
  end

  # Прицепить вагон
  def hook_carriage
    @number_of_carriages += 1
  end

attr_writer :route

end

my_train = Train.new("i76fu5d", "passenger", 5)
