class Oystercard
  CARD_LIMIT = 90
  MIN_BALANCE = 1
  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "Maxed out! limit is #{CARD_LIMIT}" if maxed?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_use
  end

 def touch_in
   raise "skint bruv!" if skint?
   @in_use = true
 end

 def touch_out
   @in_use = false
 end

 private

 def maxed?(amount)
   @balance + amount > CARD_LIMIT
 end

 def skint?
   @balance < MIN_BALANCE
 end

end
