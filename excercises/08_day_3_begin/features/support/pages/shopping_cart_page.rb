class ShoppingCartPage

  def initialize(browser)
    @browser = browser
  end

  def name_for_line_item(line_item)
    line_item_first_row_index = (line_item - 1) * 6
    @browser.table(:index => 0)[line_item_first_row_index].text
  end

  def price_for_line_item(line_item)
    line_item_first_row_index = (line_item.to_i - 1) * 6
    @browser.table[line_item_first_row_index][3].text
  end

  def total_for_cart
    @browser.td(:class => 'total_cell').text
  end
end