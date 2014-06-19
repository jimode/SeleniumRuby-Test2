require 'selenium-webdriver'
require_relative 'search'

describe "Search" do

	before(:each) do
		@driver = Selenium::WebDriver.for :firefox
		ENV['base_url'] = 'http://www.youtube.com'
		@search = Search.new(@driver)
	end

	after(:each) do	
		# @driver.quit
	end

	it "for a key word" do
		@search.with('selenium')
		@search.search_results_present?
		# expect(@driver.find_element(:css, "p.num-results").text).to eq("About 148,000 results")
		# expect(@driver.find_element(:css, "p.num-results").text).to include("results")
		
		# this seems to have been clicked before hand.
		# @driver.find_element(:id, "appbar-guide-button").click

		@search.best_of_youtube("Movies")

		# @driver.find_element(:xpath, "//div[@id='yt-masthead-signin']/button").click
		
		# # Sign into Google account.
		@search.sign_in
		@search.google_signin('wrongemail@email.com', 'wrong_password')	
	
		# expect(@driver.find_element(:id, "errormsg_0_Passwd").displayed?).to be_truthy
	end
	
end

