require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
		get contact_path
		assert_select "title", full_title("Contact")
  end

	test "another layout links" do
		get help_path
		assert_template 'static_pages/help'
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", help_path, count: 1
		assert_select "a[href=?]", about_path, count: 1
		assert_select "a[href=?]", contact_path, count: 1
		assert_select "div", count: 2
		assert_select "a[href=?]", littletest_path
		assert_select "p[class=littletest]"
		assert_select "a[href=?]", littletest_path, text:"CykaBlyat_Just a little test"
	end
end
