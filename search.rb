class Search
 
 SEARCH = { id: 'search-btn'}
 SEARCH_INPUT = { id: 'masthead-search-term' }
 SEARCH_RESULT = { css: 'p.num-results'}

 GOOGLE_EMAIL = { id: "Email" }
 GOOGLE_PASSWORD = { id: "Passwd" }

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

end
