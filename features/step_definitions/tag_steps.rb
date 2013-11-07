Then(/^I filter by the tag "(.*?)"$/) do |tag|
	click_link('Filter By Tag')
	fill_in('tags', :with => tag)
	click_button('Filter')
end
