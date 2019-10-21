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

    it "is error raise if top_up argument pushes balance over £90" do
      oystercard.top_up(Oystercard::CARD_LIMIT)
      expect { oystercard.top_up(1) }.to raise_error "Maxed out! limit is #{Oystercard::CARD_LIMIT}"
    end
  end
end
