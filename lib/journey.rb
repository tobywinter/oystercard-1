

class Journey

PENALTY_CHARGE = 5

attr_reader :penalty_charge
attr_accessor :entry_station, :entry_zone, :exit_station, :exit_zone, :travelled

  def initialize
    @penalty_charge = PENALTY_CHARGE
    @entry_station = ''
    @entry_zone = 0
    @exit_station = ''
    @exit_zone = 0
    @travelled = 0
  end

  def start(station)
    @entry_station = station.name
    @entry_zone = station.zone
  end

  def end(station)
    @exit_station = station.name
    @exit_zone = station.zone
  end

  def zones_travelled?
    if (@entry_zone <=> @exit_zone) == 1
      @travelled = (@entry_zone - @exit_zone) + 1
    elsif (@entry_zone <=> @exit_zone) == -1
      @travelled = (@exit_zone - @entry_zone) + 1
    else
      @travelled
    end
  end
end
