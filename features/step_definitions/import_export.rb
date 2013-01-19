require 'subtool'

When /^I call "([^"]+)"(?: with the arguments? "([^"]*)")?$/ do |app_name, parameters|
  @app_name = app_name
  step %(I run `#{app_name} #{parameters}`)
end

When /^I parse a Srt file named "([^"]+)"$/ do |filename|
  @subtitles = Subtool::Import::Srt.file(filename)
end

When /^I export the subtitles to a file named "(.+)"$/ do |filename|
  Subtool::Export::Srt.file(filename, @subtitles)
end

When /^I export the subtitles to STDOUT$/ do
  Subtool::Export::Srt.stdout(@subtitles)
end


Then /^I should have the following subtitles:$/ do |table|
  hasherize(table).each_with_index do |expected_values, i|
    @subtitles[i].should === Subtool::Subtitle.new(expected_values[:id], expected_values[:start], expected_values[:end], expected_values[:body])
  end
end
