

class Journey

PENALTY_CHARGE = 5

attr_reader :penalty_charge
attr_accessor :entry_station, :entry_zone, :exit_station, :exit_zone

  def initialize
    @penalty_charge = PENALTY_CHARGE
    @entry_station = ''
    @entry_zone = nil
  end

  def start(station)
    @entry_station = station.name
    @entry_zone = station.zone
  end

  def end(station)
    @exit_station = station.name
    @exit_zone = station.zone
  end

end
