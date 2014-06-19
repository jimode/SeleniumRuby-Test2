class Search
 
 SEARCH = { id: 'search-btn'}
 SEARCH_INPUT = { id: 'masthead-search-term' }
 SEARCH_RESULT = { css: 'p.num-results'}

 GOOGLE_SIGNIN = { xpath: "//div[@id='yt-masthead-signin']/button" }

 GOOGLE_EMAIL = { id: "Email" }
 GOOGLE_PASSWORD = { id: "Passwd" }
 GOOGLE_SUBMIT = { id: "signIn" }


 def initialize(driver)
 	@driver = driver
 	@driver.get(ENV['base_url']) + '/'
 end

 def with(searchterm)
 	@driver.find_element(SEARCH_INPUT).send_keys(searchterm)
 	@driver.find_element(SEARCH).submit
 end

 def search_results_present?
 	@driver.find_element(SEARCH_RESULT).displayed?
 end

 def best_of_youtube(linkname)
 	@driver.find_element(:link_text, linkname).click
 end

 def sign_in
 	@driver.find_element(GOOGLE_SIGNIN).click
 end

 def google_signin(email, password)		
 	@driver.find_element(GOOGLE_EMAIL).send_keys(email)
	@driver.find_element(GOOGLE_PASSWORD).send_keys(password)
	@driver.find_element(GOOGLE_SUBMIT).submit
 end

end
