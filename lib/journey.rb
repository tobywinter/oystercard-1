

class Journey

PENALTY_CHARGE = 5

attr_reader :penalty_charge
attr_accessor :entry_station

  def initialize
    @penalty_charge = PENALTY_CHARGE
    @entry_station = nil
  end

  def start(station)
    @entry_station = station.name
  end

end
