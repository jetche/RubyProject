require_relative '../../../features/PracticeProject/pages/home_page'


SEARCH_KEYWORD = "QA"
BROWSER = :firefox
#Create a new browser
driver = Selenium::WebDriver.for BROWSER
driver.manage.window.maximize
browser = HomePage.new(driver);

browser.navigateToWebRoot
browser.enterSearchText(SEARCH_KEYWORD)
browser = browser.clickSearchButton

browser.waitUntilSearchPagePresent
results = browser.getResultListAsArray
numOfProfile = rand(1..10)
browser = browser.getIntoFreelancerProfile(numOfProfile)

#Assertions
results[numOfProfile][:freelancer_name].equal?browser.getNameFromProfile
results[numOfProfile][:freelancer_title].equal?browser.getJobTitleFromProfile
results[numOfProfile][:freelancer_rate].equal?browser.getPriceRateFromProfile
results[numOfProfile][:freelancer_location].equal?browser.getLocationFromProfile

cant=0
if(browser.getJobTitleFromProfile.include? SEARCH_KEYWORD)
  cant += 1
end
if(browser.getDescriptionFromProfile.include? SEARCH_KEYWORD)
  cant +=1
end
if(cant==0)
  puts "Assertion failed! Keyword is not present in the profile!"
end

arrayWithKeyword = []
arrayWithoutKeyword = []
results.each do |freelancer|
  if(freelancer!=nil)

    if(freelancer[:freelancer_title].include? SEARCH_KEYWORD)
      arrayWithKeyword.push(freelancer)
    else
      arrayWithoutKeyword.push(freelancer)
    end
  end
end
puts "------------WITH KEYWORD----------------"
puts arrayWithKeyword
puts "------------WITHOUT KEYWORD----------------"
puts arrayWithoutKeyword

browser.quit



