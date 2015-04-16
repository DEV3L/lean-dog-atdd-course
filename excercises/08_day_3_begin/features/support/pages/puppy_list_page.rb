class PuppyListPage
  include PageObject

  def goto_puppy_list
    navigate_to "http://puppies.herokuapp.com"
  end

  def view_puppy_details(puppy_number)
    index = puppy_number - 1
    @browser.button(:value => 'View Details', :index => index).click
  end
end