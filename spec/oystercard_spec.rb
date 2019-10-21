require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  context 'when card is intialized,' do

    it 'instance of card is expected to have default balance of 0' do
      expect(oystercard.balance).to eq 0
    end



  end
end
