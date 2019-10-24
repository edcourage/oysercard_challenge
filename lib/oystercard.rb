class Oystercard
  CARD_LIMIT = 90
  MIN_BALANCE = 1
  attr_reader :balance, :journey, :journey_log

  def initialize
    @balance = 0
    @journey = {}
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
    @journey != {}
  end

 def touch_in(station)
   raise "skint bruv!" if skint?

   @journey = {entry_station: station, exit_station: nil}


 end

 def touch_out(station)

   deduct(MIN_BALANCE)
   save_journey(station)
   reset_journey

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
   @journey[:exit_station] = station
   @journey_log << @journey
 end

 def reset_journey
   @journey = {}
 end

end
