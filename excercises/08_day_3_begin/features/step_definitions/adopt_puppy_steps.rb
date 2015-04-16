Given(/^I am looking for a puppy to adopt$/) do
  @puppy_list_page = PuppyListPage.new @browser
  @puppy_details_page = PuppyDeatilsPage.new @browser
  @shopping_cart_page = ShoppingCartPage.new @browser
  @order_details_page = OrderDeatilsPage.new @browser

  @puppy_list_page.goto_puppy_list
end

And(/^I view the details of puppy (\d+)$/) do |puppy_number|
  @puppy_list_page.view_puppy_details puppy_number.to_i
end

And(/^I adopt the puppy$/) do
  @puppy_details_page.adopt_button
end

And(/^I complete the adoption$/) do
  @shopping_cart_page.complete_adoption_button
end

And(/^I adopt another puppy$/) do
  @shopping_cart_page.adopt_another_button
end

Then(/^I should see the message "([^"]*)"$/) do |expected_message|
  expect(@puppy_list_page.text).to include expected_message
end

And(/^I checkout with:$/) do |checkout_data_table|
  checkout_data = checkout_data_table.hashes.first
  @order_details_page.name = checkout_data["name"]
  @order_details_page.address = checkout_data["address"]
  @order_details_page.email = checkout_data["email"]
  @order_details_page.payment_type = checkout_data["payment type"]
  @order_details_page.order_button
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |expected_name, line_item|
  expect(@shopping_cart_page.name_for_line_item(line_item.to_i)).to include expected_name
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |expected_subtotal, line_item|
  expect(@shopping_cart_page.price_for_line_item(line_item.to_i)).to eql expected_subtotal
end

Then(/^I should see "([^"]*)" as the total for the cart$/) do |expected_total|
  expect(@shopping_cart_page.total_element.text).to eql expected_total
end
