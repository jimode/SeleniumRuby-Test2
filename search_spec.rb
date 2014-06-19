require 'selenium-webdriver'

describe "Search" do

	before(:each) do
		@driver = Selenium::WebDriver.for :firefox
	end

	after(:each) do	
		# @driver.quit
	end

	it "for a key word" do
		@driver.get 'http://www.youtube.com'
		@driver.find_element(:id, 'masthead-search-term').send_keys 'selenium'
		@driver.find_element(:id, 'search-btn').click
		# expect(@driver.find_element(:css, "p.num-results").text).to eq("About 148,000 results")
		expect(@driver.find_element(:css, "p.num-results").text).to include("results")
		
		# this seems to have been clicked before hand.
		# @driver.find_element(:id, "appbar-guide-button").click

		@driver.find_element(:link_text, "Movies").click

		@driver.find_element(:xpath, "//div[@id='yt-masthead-signin']/button").click
		
		# Sign into Google account.
		@driver.find_element(:id, "Email").send_keys "wrongemail@email.com"
		@driver.find_element(:id, "Passwd").send_keys "wrong_password"
		@driver.find_element(:id, "signIn").click
		expect(@driver.find_element(:id, "errormsg_0_Passwd").displayed?).to be_truthy
	end
	
end

