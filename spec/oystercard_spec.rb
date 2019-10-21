require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  context 'when card is intialized,' do
    it 'instance of card is expected to have default balance of 0' do
      expect(oystercard.balance).to eq 0
    end

    it 'is not in_journey' do
      expect(oystercard).not_to be_in_journey
    end
  end

  describe '#top_up' do
    it 'adds money to card' do
      expect{ oystercard.top_up 15 }.to change{ oystercard.balance}.by 15
    end

    it "is error raise if top_up argument pushes balance over £90" do
      oystercard.top_up(Oystercard::CARD_LIMIT)
      expect { oystercard.top_up(1) }.to raise_error "Maxed out! limit is #{Oystercard::CARD_LIMIT}"
    end
  end

  describe '#deduct' do
    it 'takes money off card' do
      oystercard.top_up(10)
      expect{ oystercard.deduct 5 }.to change{ oystercard.balance}.by -5
    end
  end

  describe '#touch_in' do
    it 'registers card is in_journey?' do
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'registers card is no longer in_journey?' do
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end
  end

end
