Given(/^abdi signs up with email "(.*?)" and username "(.*?)" and password "(.*?)" and password confirmation "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6|
	fill_in('email', :with => email)
	fill_in('username', :with => link_title)
	fill_in('password', :with => link_description)
	fill_in('confirm password', :with => confirm_password)
	click_button('Sign up')
end