#### Require Oystercard Class
2.7.0 :001 > require './lib/oystercard.rb'\
 => true 

#### Establish Stations 
2.7.0 :002 > station_a = Station.new("A", 1)\
2.7.0 :003 > station_b = Station.new("B", 2)\
2.7.0 :004 > station_c = Station.new("C", 3)

#### Create a new card
2.7.0 :005 > card = Oystercard.new

#### Top up £100 and expect Error as it exceeds maximum balance of £90
2.7.0 :006 > card.top_up(100)\
Traceback (most recent call last):\
        6: from /Users/garethwoodman/.rvm/rubies/ruby-2.7.0/bin/irb:23:in '<main>' \
        5: from /Users/garethwoodman/.rvm/rubies/ruby-2.7.0/bin/irb:23:in 'load'\
        4: from /Users/garethwoodman/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in '<top (required)>'\
        3: from (irb):6\
        2: from /Users/garethwoodman/Desktop/Makers Academy/Projects/my_portfolio/week_2/Oystercard_solo/lib/oystercard.rb:17:in 'top_up'\
        1: from /Users/garethwoodman/Desktop/Makers Academy/Projects/my_portfolio/week_2/Oystercard_solo/lib/message.rb:6:in 'reached_maximum?'\
RuntimeError (Maximum of 90 balance exceeded)

#### Top up £50
2.7.0 :007 > card.top_up(50)\
 => 50 
 
#### Touch in at station
2.7.0 :008 > card.touch_in(station_a)\
 => nil 

#### Touch in again at station_b (Zone 2) and apply penalty of £6
2.7.0 :009 > card.touch_in(station_b)\
Penalty applied\
 => 44 
 
#### Touch out at station_c (Zone 3) and deduct £2
2.7.0 :010 > card.touch_out(station_c)\
 => 42 
 
#### Touch out again and apply penalty
2.7.0 :011 > card.touch_out(station_a)\
Penalty applied\
 => 36 
 
#### Touch in and touch out of station_a (Zone 1) and deduct £1
2.7.0 :012 > card.touch_in(station_a)\
 => nil\
2.7.0 :013 > card.touch_out(station_a)\
 => 35 

#### Touch in at station_c (Zone 3) and touch out at station_a (Zone 1) and deduct £3
2.7.0 :014 > card.touch_in(station_c)\
 => nil\
2.7.0 :015 > card.touch_out(station_a)\
 => 32 

#### Throws error if balance too low on card
2.7.0 :016 > no_balance = Oystercard.new\
2.7.0 :017 > no_balance.touch_in(station_a)\
Traceback (most recent call last):\
        6: from /Users/garethwoodman/.rvm/rubies/ruby-2.7.0/bin/irb:23:in '<main>'\
        5: from /Users/garethwoodman/.rvm/rubies/ruby-2.7.0/bin/irb:23:in 'load'\
        4: from /Users/garethwoodman/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in '<top (required)>'\
        3: from (irb):17\
        2: from /Users/garethwoodman/Desktop/Makers Academy/Projects/my_portfolio/week_2/Oystercard_solo/lib/oystercard.rb:22:in 'touch_in'\
        1: from /Users/garethwoodman/Desktop/Makers Academy/Projects/my_portfolio/week_2/Oystercard_solo/lib/message.rb:11:in 'has_minimum?'\
RuntimeError (Balance too low)
