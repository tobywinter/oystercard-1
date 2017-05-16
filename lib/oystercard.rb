class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1

attr_accessor :balance
attr_reader :touched_in, :touched_out

  def initialize
     @balance = 0
     @touched_in = false
     @touched_out = false
  end

  def top_up(amount)
    raise "Balance has exceeded limit of #{LIMIT}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
  @touched_in = true
  end

  def touch_out
    @touched_out = true
    @balance -= MINIMUM_FARE
  end

  def in_journey?
    return false if @touched_out == true
    return true if @touched_in == true
    false
  end

  private

    def deduct(fare)
      @balance -= fare
    end

end
