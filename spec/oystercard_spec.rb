require 'oystercard'

describe Oystercard do 

  let(:cardWithBalance100) { double :oystercard, :balance => 100}

  describe "#balance" do
    it "returns the balance on the .oystercard" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top-up" do
    it "should increase the balance amount" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
    it "should raise an error if maximum balance is exceeded by #topup" do
      max = Oystercard::MAXIMUM_BALANCE
      subject.top_up(90)
      expect { subject.top_up(1) }.to raise_error("Maximum value of #{max} on Oystercard reached!!")
    end

  end

 

  describe "#in_journey?" do
    it "should return false" do 
      expect(subject.in_journey?).to eq false
    end
  end

  describe "#touch_in" do 
    it "should change #in_journey to true" do 
      subject.top_up(Oystercard::MINIMUM_FARE)
      subject.touch_in("Aldgate East")
      expect(subject.in_journey?).to eq true
    end
    it "should raise an error if insufficient funds (minumum fare - 1)" do
      subject.top_up(Oystercard::MINIMUM_FARE - 1)
      expect { subject.touch_in("Aldgate East") }.to raise_error("Insufficient funds, you have #{subject.balance} on your card")
    end
    it "should set entry station when it is touched_in" do
      subject.top_up(Oystercard::MINIMUM_FARE)
      subject.touch_in("Aldgate East")
      expect(subject.entry_station).to eq "Aldgate East"
    end
  end
  

  describe "#touch_out" do
    
    
    it "should change #in_journey to false" do
      subject.top_up(1)
      subject.touch_in("Aldgate East")
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
    it "should reduce the balance by the MINIMUM FARE" do
      subject.top_up(10)
      subject.touch_in("Aldgate East")
      expect { subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
    end

  end

end
