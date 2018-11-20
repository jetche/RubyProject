require_relative '../../../features/PracticeProject/pages/base_page'
require_relative '../../../features/PracticeProject/pages/search_result_page'
require 'selenium-webdriver'

class HomePage < BasePage

  def initialize (driver)
    puts("Creating Home page..")
    super(driver)
  end

  #ELEMENTS

  def searchBox
    return @@driver.find_element(:name,"q")
  end

  def enterSearchText(text)
    puts("Entering Search Text in SearchBox")
    elements = @@driver.find_elements(:xpath,"//input[@placeholder=\"Find Freelancers\"]")
    if(elements.count==0)
      elements = @@driver.find_elements(:xpath,"//input[@placeholder=\"Find Jobs\"]")
    end
    elements.each do |searchBox|
      if(searchBox.displayed?)
        @@driver.action.move_to(searchBox).perform
        searchBox.click
        searchBox.send_keys(text)
      end
    end
  end

  def clickSearchButton
    puts("Clicking Magnifying Glass Button...")
    buttons = @@driver.find_elements(:xpath, "//button[@class='btn p-0-left-right']")
    buttons.each do |button|
      if(button.displayed?)
        button.click
      end
    end
    puts("Redirecting to SearchResult page...")
    return SearchResultPage.new(@@driver)
  end

end