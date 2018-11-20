require 'selenium-webdriver'

class BasePage

  @@driver = nil

  def initialize(driver)
    @@driver = driver
  end

  def navigateToWebRoot
    puts("Open Home page of http://www.upwork.com")
    @@driver.navigate.to("http://www.upwork.com")
    return HomePage.new(@@driver)
  end

  def quit
    puts ("Exiting driver....")
    @@driver.quit
  end

  def getPageTitle
    return @@driver.title
  end

end