# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции
# указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной

class Route
  def initislize(initial_station, final_station, intermediate_stations = [])
    @initial_station = initial_station
    @final_station = final_station
    @intermediate_stations = intermediate_stations
  end
  +

  def add_intermediate_station(station)
    @intermediate_stations.push(station)
  end

  def remove_intermediate_station(station)
    @intermediate_stations.delete(station)
  end

  def display_route
    puts @initial_station
    puts @intermediate_stations
    puts @final_station
  end
end
