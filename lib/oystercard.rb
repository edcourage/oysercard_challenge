class Oystercard
  CARD_LIMIT = 90
  MIN_BALANCE = 1
  attr_reader :balance, :entry_station, :journey_log

  def initialize
    @balance = 0
    @in_use = false
    @journey_log = []
  end

  def top_up(amount)
    raise "Maxed out! limit is #{CARD_LIMIT}" if maxed?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @entry_station != nil
  end

 def touch_in(station)
   raise "skint bruv!" if skint?
   @in_use = true
   @entry_station = station
 end

 def touch_out(station)
   @in_use = false
   deduct(MIN_BALANCE)
   save_journey(station)
   @entry_station = nil
 end

 private

 def maxed?(amount)
   @balance + amount > CARD_LIMIT
 end

 def skint?
   @balance < MIN_BALANCE
 end

 def deduct(amount)
   @balance -= amount
 end

 def save_journey(station)
   @journey_log << {touch_in: @entry_station, touch_out: station}
 end

end
