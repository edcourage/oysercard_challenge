require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  context 'when card is intialized,' do
    it 'instance of card is expected to have default balance of 0' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'does top_up add money to card' do
      oystercard.top_up(10)
      oystercard.top_up(5)
      expect(oystercard.balance).to eq 15
    end
  end
end
