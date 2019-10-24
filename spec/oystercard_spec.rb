require 'oystercard'

describe Oystercard do
  let(:station) { double("station") }
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

  describe '#touch_in' do
    it 'registers card is in_journey?' do
      oystercard.top_up(1)
      oystercard.touch_in(station)
      expect(oystercard).to be_in_journey
    end

    it 'expect error if balance is below £1' do
      expect { oystercard.touch_in(station) }.to raise_error "skint bruv!"
    end

    it "does oystercard know the station it has been touched in?" do

      oystercard.top_up(1)
      expect { oystercard.touch_in(station) }.to change{ oystercard.entry_station }.to eq station

    end
  end

  describe '#touch_out' do
    it 'registers card is no longer in_journey?' do
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it "checks £1 is taken of card when touching out" do
      oystercard.top_up(10)
      oystercard.touch_in(station)
      expect { oystercard.touch_out }.to change{ oystercard.balance }.by(-1)
    end

    it "forgets entry station once touched out." do
      oystercard.top_up(10)
      oystercard.touch_in(station)
      expect { oystercard.touch_out }.to change{ oystercard.entry_station }.to eq nil

    end
  end

end
