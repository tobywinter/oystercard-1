class Oystercard

LIMIT = 90

attr_accessor :balance

  def initialize
     @balance = 0
  end

  def top_up(amount)
    raise "Balance has exceeded limit of #{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

end
