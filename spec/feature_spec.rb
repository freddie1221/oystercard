require './lib/oystercard'

card = Oystercard.new

card.top_up(10)

card.touch_in("Aldgate")

card.touch_in("Aldgate")