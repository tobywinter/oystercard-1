class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1

attr_accessor :balance
attr_reader :in_journey

  def initialize
     @balance = 0
     @in_journey = false
  end

  def top_up(amount)
    raise "Balance has exceeded limit of #{LIMIT}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

  def in_journey?
    return false if @in_journey == false
    return true if @in_journey == true
    false
  end

  private

    def deduct(fare)
      @balance -= fare
    end

end
