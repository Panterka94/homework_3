# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

load 'Train.rb'

class Station
  attr_reader :list_of_trains

  def initialize(station_name)
    @station_name = station_name
    @list_of_trains = []
  end

  # Добавить поезд на станцию
  def add_train(new_train)
    @list_of_trains.push(new_train)
  end

  # ВЫвести список поездов по типу: кол-во пассажирских  и записать кол-во грузовых
  def list_of_trains_by_type()
    number_of_passenger_trains = 0
    for train in @list_of_trains do
      if train.train_type == "passenger"
        number_of_passenger_trains += 1
      end
    end
    puts "Number of passenger trains: #{number_of_passenger_trains}"
    puts "Number of cargo trains: #{@list_of_trains.size - number_of_passenger_trains}"
  end

  # Отправить поезд и удалить его из списка
  def send_train
    raise "There are no trains at the station" if @list_of_trains.size == 0
    puts "Train number: #{@list_of_trains[0].train_number} leaves"
    @list_of_trains = @list_of_trains.delete_at(0)
  end
end

#my_station = Station.new("hovrino")

#train_1 = Train.new("45", "passenger", "20")
#train_2 = Train.new("A58l", "cargo", "87")
#train_3 = Train.new("13", "passenger", "15")

#my_station.add_train(train_1)
#my_station.add_train(train_2)
#my_station.add_train(train_3)
#puts my_station.list_of_trains
#puts my_station.list_of_trains_by_type
#puts my_station.send_train
#puts my_station.list_of_trains
