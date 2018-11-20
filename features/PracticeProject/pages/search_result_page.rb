require_relative '../../../features/PracticeProject/pages/base_page'
require_relative '../../../features/PracticeProject/pages/home_page'
require_relative '../../../features/PracticeProject/pages/profile_page'

class SearchResultPage < BasePage

  def initialize (driver)
    puts("Creating SearchResult page")
    super(driver)
  end

  def getResultListAsArray
    puts("Getting search results as an array...")
    array = []
    elements = @@driver.find_elements(:xpath, "//section//section[@data-qa]")
    elements.each_with_index do |element,index|
      hash = {}
      if (index>0)
        hash[:freelancer_name] = element.find_element(:xpath,"//section//section[@data-qa]["+index.to_s+"]//h4/a[@class='freelancer-tile-name']").text
        hash[:freelancer_title] = element.find_element(:xpath,"//section//section[@data-qa]["+index.to_s+"]//h4[@data-qa='tile_title']").text
        hash[:freelancer_rate] = element.find_element(:xpath,"//section//section[@data-qa]["+index.to_s+"]//strong[@class='pull-left']").text
        hash[:freelancer_location] = element.find_element(:xpath,"//section//section[@data-qa]["+index.to_s+"]//strong[@class='d-none d-md-inline-block']").text
        array[index] = hash
      end
    end

    return array

  end

  def waitUntilSearchPagePresent
    puts("Waiting for Search page")
    wait = Selenium::WebDriver::Wait.new
    wait.until{@@driver.find_element(:xpath,"//h1[@id=\"oSearchContractorsHeader\"]").text == "Qa Freelancers"}
  end

  def getIntoFreelancerProfile(num)
    puts("Clicking into the specified profile of the search results")
    @@driver.find_element(:xpath,"//section//section[@data-qa]["+num.to_s+"]//h4/a[@class='freelancer-tile-name']").click
    puts("User redirected to profile page...")
    return ProfilePage.new(@@driver)
  end

end