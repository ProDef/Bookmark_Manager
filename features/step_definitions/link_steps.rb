Given(/^the following links have been saved:$/) do |links|
	links.hashes.each do |link|
  		Link.create(link)
	end
end

Given(/^I add a link "(.*?)" with url "(.*?)"$/) do |link_title, link_uri, link_description|
	clink_link('Add Link')
	fill_in('url, :width => link_uri')
	fill_in('title, :width => link_title')
	click_button('Add Link')
end