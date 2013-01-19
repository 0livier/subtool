require 'subtool'

When /^I add a delay of (-?\s*\d+(?:\.\d+)?) seconds?$/ do |seconds|
  @subtitles = Subtool::Filter::Delay.add_to(@subtitles, (Float(seconds) * 1000).to_i)
end
