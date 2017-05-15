class Oystercard

LIMIT = 90

attr_accessor :balance
attr_reader :touched_in

  def initialize
     @balance = 0
     @touched_in = false
  end

  def top_up(amount)
    raise "Balance has exceeded limit of #{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
  @touched_in =true
  end


end
