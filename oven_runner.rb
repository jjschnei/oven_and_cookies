require_relative 'cookie_oven.rb'

chocolate_chip_cookies = ChocolateChip.new
peanut_butter_cookies = PeanutButter.new
oven = Oven.new
oven.add_cookie_to_oven(chocolate_chip_cookies)
oven.cook(10)
oven.add_cookie_to_oven(peanut_butter_cookies)
oven.cook(10)
oven.remove_done_cookies
p oven.cooked_cookies
p oven.current_cookies_in_oven

