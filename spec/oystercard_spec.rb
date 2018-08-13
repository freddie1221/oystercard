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
      subject.top_up(90)
      expect { subject.top_up(1) }.to raise_error("Maximum value on Oystercard reached!!")
    end

  end
end

