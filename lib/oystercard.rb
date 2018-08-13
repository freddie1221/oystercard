class Oystercard
  
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station
  
  
  def initialize
    @balance = 0
    @card_status = false
  
  end

  def top_up(amount)

    fail "Maximum value of #{MAXIMUM_BALANCE} on Oystercard reached!!" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end


  def in_journey?
    true if @entry_station = !nil # && exit_station = nil
  end

  def touch_in(station)
    fail "Insufficient funds, you have #{self.balance} on your card" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end


# In order to use public transport
# As a customer
# I want money on my card

# In order to keep using public transport
# As a customer
# I want to add money to my card

# In order to protect my money
# As a customer
# I don't want to put too much money on my card

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

# In order to get through the barriers
# As a customer
# I need to touch in and out

# In order to pay for my journey
# As a customer
# I need to have the minimum amount for a single journey

# In order to pay for my journey
# As a customer
# I need to pay for my journey when it's complete

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from

# In order to know where I have been
# As a customer
# I want to see to all my previous trips

# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in

# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out

# In order to be charged the correct amount
# As a customer
# I need to have the correct fare calculated