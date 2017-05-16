class Oystercard

LIMIT = 90

attr_accessor :balance
attr_reader :touched_in, :touched_out

  def initialize
     @balance = 0
     @touched_in = false
     @touched_out = false
  end

  def top_up(amount)
    raise "Balance has exceeded limit of #{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
  @touched_in = true
  end

  def touch_out
    @touched_out = true
  end

  def in_journey?
    return false if @touched_out == true
    return true if @touched_in == true
    false
  end

end
