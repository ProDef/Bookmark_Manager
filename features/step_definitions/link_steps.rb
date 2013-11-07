Given(/^the following links have been saved:$/) do |links|
	links.hashes.each do |link|
  		Link.create(link)
	end
end

Given(/^I add a link "(.*?)" with url "(.*?)" and description "(.*?)" and tags "(.*?)"$/) do |link_title, link_uri, link_description, link_tags|
	click_link('Add Link')
	fill_in('url', :with => link_uri)
	fill_in('title', :with => link_title)
	fill_in('description', :with => link_description)
	fill_in('tags', :with => link_tags)
	click_button('Add Link')
end
