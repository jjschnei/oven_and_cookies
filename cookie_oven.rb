class Cookie
  attr_accessor :time_cooked

  NEEDED_BAKE_TIME = 20

  def initialize(args = {})
    @time_cooked = args.fetch(:time_cooked, 0)
  end

  def burned?
    @time_cooked > NEEDED_BAKE_TIME
  end

  def done?
    @time_cooked >= NEEDED_BAKE_TIME
  end

  def raw?
    @time_cooked < NEEDED_BAKE_TIME
  end

end

class ChocolateChip < Cookie
  attr_reader :ingredients
  def initialize
    @ingredients = {chocolate_chips: "1 cup", flour: "1 cup", butter: "1 stick"}
    super
  end
end

class PeanutButter < Cookie
  attr_reader :ingredients
  def initialize
    @ingredients = {peanut_butter: "1 tablespoon", flour: "1 cup", }
    super
  end
end


class Oven
  attr_reader :current_cookies_in_oven, :cooked_cookies
  def initialize(args = {})
    @on = args.fetch(:on, false)
    @current_cookies_in_oven = args.fetch(:current_cookies_in_oven, [])
    @capacity = 20
    @cooked_cookies = args.fetch(:cooked_cookies, nil)
  end

  def cook(minutes)
    @current_cookies_in_oven.each {|cookie| cookie.time_cooked += minutes}
  end

  def add_cookie_to_oven(cookie)
    @current_cookies_in_oven << cookie if cookie.kind_of? Cookie
  end

  #This method doesn't work. Trying to get finished cookes out of the oven and into the cooked cookies array.
  # def remove_done_cookies
  #   @cooked_cookies << @current_cookies_in_oven.select { |cookie| cookie.done? }
  #   @current_cookies_in_oven.delete_if { |cookie| cookie.done? }
  # end

  # this code works for deleting done cookies:
  def remove_done_cookies
    @current_cookies_in_oven.delete_if { |cookie| cookie.done? }
  end

end

class Bakery
  def initialize(args = {})
    @cookies_for_sale = args.fetch(:cookies_for_sale, [])
    @cookie_price = args.fetch(:cookie_price, 1.50)
    @cookies_sold = args.fetch(:cookies_sold, 0)
  end

  def move_from_oven_to_display
  end

  def sell_cookie(type)
  end

  def whats_on_display
    @cookies_for_sale
  end

  def gross_sales

  end


end


# chocolate_chip_cookies = ChocolateChip.new
# peanut_butter_cookies = PeanutButter.new


# oven = Oven.new
# oven.add_cookie_to_oven(chocolate_chip_cookies)
# oven.cook(10)
# oven.add_cookie_to_oven(peanut_butter_cookies)
# oven.cook(10)
# oven.remove_done_cookies
# p oven.current_cookies_in_oven
