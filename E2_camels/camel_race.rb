module Camels
  require_relative 'camel'

  class Camel_Race
    @@total_distance = 3210
    @@lap_distance = @@total_distance / 5

    def self.total_distance
      @@total_distance
    end

    def self.lap_distance
      @@lap_distance
    end

    attr_reader :camel_quantity, :camel_data, :race_data, :camels, :data_race, :winners

    def initialize
      @camel_quantity = ''
      @camel_data = ''
      @race_data = ''
      @camels = {}
      @data_race = []
      @positions = {}
      @winners = {}
      @winner = []
      @points = {}
    end

    def inspect
      str = "Carrera con #{@camels.count} camellos\n"
      @camels.keys.each { |key| str += "#{@camels[key].inspect}\n" }
      str
    end

    def read_file(dir)
      file = File.open(dir, 'r')
      count = 0
      file.each_line do |line|
        if count == 0
          @camel_quantity = line
        elsif count == 1
          @camel_data = line
          create_cammels
        else
          @race_data << line
        end
        count += 1
      end
      file.close
    end

    def create_cammels
      camels_with_id = @camel_data.split(';')
      camels_with_id.each do |camel_id|
        camel_id_array = camel_id.split(',')
        return if camel_id_array[0].nil? || camel_id_array[1].nil?
        camel_name = camel_id_array[0].strip
        camel_id = camel_id_array[1].strip
        if @camels[camel_id].nil?
          camel = Camels::Camel.new(camel_name, camel_id)
          @camels[camel_id] = camel
        end
      end
    end

		def get_raw_data
      @data_race = @race_data.scan(/\w+\s*,\s*[0-9\.]+/)
		end

    def process_data
      return if @data_race.empty?
      @data_race.each do |race|
        race = race.split(',')
        return if race.empty?
        id = race[0].strip
        distance = race[1].strip.to_f
        @camels[id].distances.push(distance) unless @camels[id].nil?
      end
      @camels.keys.each { |key| camels[key].generate_laps_time }
    end

    def process_winner
      camels = @camels.values
      camels.sort_by!(&:total_time)
      camels.select! { |camel| camel.total_time == camels[0].total_time }
      @winner = camels
    end

    def empty_winners
      @winners = {}
    end

    def empty_winners_lap(lap)
      @winners[lap] = { 1 => [], 2 => [], 3 => [] }
    end

    def number_of_winners(lap)
      sum = 0
      @winners[lap].keys.each { |key| sum += winners[lap][key].count }
      sum
    end

    def process_winners
      camels = @camels.values
      empty_winners
      (1..5).each do |lap|
        empty_winners_lap(lap)
        position = 1
        last_camel_time = 0
        camels.sort_by! { |camel| camel.times[lap] }
        camels.each do |camel|
          if last_camel_time == 0 || camel.times[lap] <= last_camel_time
            last_camel_time = camel.times[lap]
            @winners[lap][position].push(camel)
          elsif position < 3
            next if number_of_winners(lap) >= 3
            position += 1 if @winners[lap][position].count >= 2
            position += 1
            last_camel_time = camel.times[lap]
            @winners[lap][position].push(camel)
          else
            next
          end
        end
      end
    end

    def process_points
      camels = @camels.values
      camels.each { |camel| @points[camel] = 0 }
      (1..3).each do |lap|
        @winners[lap].keys.each do |position|
          camels = @winners[lap][position]
          points = 0
          if position == 1
            points = 6
          elsif position == 2
            points = 4
          elsif position == 3
            points = 1
          end
          camels.each do |camel|
            @points[camel] += points
          end
        end
      end
    end

    def camels_str
      str = "Camellos:\n"
      @camels.values.each { |camel| str += "#{camel.name}, #{camel.id}\n" }
      str += "\n"
      str
    end

    def laps_str
      str = "Resultado vueltas:\n"
      @winners.keys.each do |lap|
        str += "Vuelta #{lap}\n"
        @winners[lap].keys.each do |position|
          next if @winners[lap][position][0].nil?
          str += position.to_s
          @winners[lap][position].each do |camel|
            str += ',' if camel != @winners[lap][position][0]
            str += " #{camel.name}"
          end
          str += " (#{@winners[lap][position][0].times[lap]} seg)\n"
        end
        str += "\n"
      end
      str
    end

    def winner_str
      if @winner.count == 1
        return "Ganador del Derby del Gran Camejockey: #{@winner[0].name}\n\n"
      else
        return "Ganadores del Derby del Gran Camejockey:\n#{@winner.map { |camel| "#{camel.name}\n" }}\n\n"
      end
    end

    def points_str
      str = "Puntajes:\n"
      @points.keys.each { |camel| str += "#{camel.name}: #{@points[camel]}\n" }
      str
    end
  end
end
