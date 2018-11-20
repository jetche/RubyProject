require_relative '../../../features/PracticeProject/pages/base_page'
require_relative '../../../features/PracticeProject/pages/search_result_page'

class ProfilePage < BasePage

  def initialize (driver)
    puts("Creating profile page...")
    super(driver)
  end

  def getNameFromProfile
    puts("Searching for Freelancer name")
    return @@driver.find_element(:xpath,"//span[@itemprop='name']").text
  end

  def getJobTitleFromProfile
    puts("Searching for Freelancer Job Title")
    return @@driver.find_element(:xpath,"//span[@data-ng-bind-html]").text
  end

  def getPriceRateFromProfile
    puts("Searching for Freelancer price rate")
    return @@driver.find_elements(:xpath,"//span[@itemprop='pricerange']")[1].text
  end

  def getLocationFromProfile
    puts("Searching for Freelancer location")
    return @@driver.find_elements(:xpath,"//span[@itemprop='country-name']")[1].text
  end

  def getDescriptionFromProfile
    puts("Searching for Freelancer Description")
    return @@driver.find_element(:xpath,"//span[@class='ng-scope ng-hide']").text
  end
end