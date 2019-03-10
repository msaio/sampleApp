require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
	def setup
		@base_title = "Ruby on Rails Tutorial Sample App"
	end
	
	test "can get home ?" do
		get hello_url
		assert_response :success
		@page_title = "Hello World"
		assert_select "title", "#{@page_title}", {:count=>1}
 		assert_select "p", :count => 2 # find 2 p-tags 
		assert_select "h1", count: 0
		assert_select "h2", 0
		assert_select "ol", {:count=>1}
	end
	
	test "should get home" do
    get root_path
    assert_response :success
		# assert_select "title", "Ruby on Rails Tutorial Sample App"
		
  end

  test "should get help" do
  	get help_path
		assert_response :success
		@page_title = "Help"
		# assert_select "title", "Help | #{@base_title}"
		assert_select "title", "#{@page_title} | #{@base_title}"
  end

  test "should get about" do
	 	get about_path
	 	assert_response :success
  	assert_select "title", "About | #{@base_title}"
  end
	
	test "should get testing" do
		get static_pages_testing_url
		assert_response :success
	end

	test "should get contact" do
		get contact_path
		assert_response :success
		assert_select "title", "Contact | #{@base_title}"
	end
end
