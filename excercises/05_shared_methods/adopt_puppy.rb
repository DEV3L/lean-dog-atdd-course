require 'watir-webdriver'
load 'adoption_helper.rb'

goto_puppies_page
adopt_puppy 1
proceed_to_checkout
adoption_completion_form "Justin Beall", "4070 Stonehaven Rd.\nSouth Euclid, OH 44121", "jus.beall@gmail.com", "Credit card"
success_message_displays
close_browser
