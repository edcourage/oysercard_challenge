class Oystercard
  CARD_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maxed out! limit is #{CARD_LIMIT}" if maxed?(amount)
    @balance += amount

  end


  private

  def maxed?(amount)
    @balance + amount > CARD_LIMIT 
  end

end
