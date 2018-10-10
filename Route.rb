# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции
# указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route
  # Метод конструктор
  def initialize(initial_station, final_station, intermediate_stations = [])
    @initial_station = initial_station
    @final_station = final_station
    @intermediate_stations = intermediate_stations
  end

  # Добавить промежуточную станцию
  def add_intermediate_station(station)
    @intermediate_stations.push(station)
  end

  # Удалить промежуточную станцию
  def remove_intermediate_station(station)
    @intermediate_stations.delete(station)
  end

  # Выводит список станций в консоль
  def display_route
    puts @initial_station
    puts @intermediate_stations
    puts @final_station
  end

  # Возвращает массив со всеми станциями маршрута
  def station_list
    stations = [].push(@initial_station)
    for element in @intermediate_stations do
      stations.push(element)
    end
    stations.push(@final_station)
    return stations
  end
end

#route = Route.new("Koptevo", "Bot Sad", ["Hovrino", "Sokol")
#route.display_route
#route.add_intermediate_station("Dinamo")
#route.display_route
#route.remove_intermediate_station("Hovrino")
#route.display_route
#stations = route.station_list
#puts stations
