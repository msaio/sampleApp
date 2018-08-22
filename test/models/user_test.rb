require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	def setup 
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "    "
		assert_not @user.valid?
		#assert @user.valid?
	end

	test "email should be present" do
		@user.email = ""
		assert_not @user.valid?
	end

	test "name should not be too long" do
		@user.name = "a"*51
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a"*244 +"@example.com"
		assert_not @user.valid?
	end

	test "email validation should accept valid addresses" do
		valid_add = %w[user@example.com hentai@foo.com ditmemau@foo.bar.org first.last@foo.jp cyka+hentai@baz.cn]
		valid_add.each do |valid_add|
			@user.email = valid_add
			assert @user.valid?, "#{valid_add.inspect} should ve valid"
		end
	end

	test "email addresses should be unique" do
		duplicate_user = @user.dup
		duplicate_user.email = @user.email.upcase
		@user.save
		assert_not duplicate_user.valid?
	end
	
	test "email addresses should be saved as lower-case" do
		mixed_case_email = "Foo@ExAMPle.com"
		@user.email = mixed_case_email
		@user.save
		#assert_equal mixed_case_email, @user.reload.email
		assert_equal mixed_case_email.downcase, @user.reload.email
	end
		
	test "password should be present (nonblank)" do
		@user.password = @user.password_confirmation = " "*6
		assert_not @user.valid?
	end

	test "" do
		@user.password = @user.password_confirmation = "a"*5
		assert_not @user.valid?
	end
end
