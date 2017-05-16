class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1

attr_accessor :balance
attr_reader :entry_station

  def initialize
     @balance = 0
     @entry_station = nil
  end

  def top_up(amount)
    raise "Balance has exceeded limit of #{LIMIT}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out
    @entry_station = nil
    deduct(MINIMUM_FARE)
  end

  def in_journey?
    return false if @entry_station == nil
    return true if @entry_station == entry_station
    false
  end

  private

    def deduct(fare)
      @balance -= fare
    end

end
