require 'oystercard'

describe Oystercard do 
  describe "#balnce" do
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

  describe "#deduct" do
    it "should deduct from the balance amount" do 
      subject.top_up(20)
      subject.deduct(5)
      expect(subject.balance).to eq 15
    end
  end

  describe "#in_journey?" do
    it "should return false" do 
      expect(subject.in_journey?).to eq false
    end
  end

  describe "#touch_in" do 
    it "should change #in_journey to true" do 
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
  end

  describe "#touch_out" do
    it "should change #in_journey to false" do 
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end
end
