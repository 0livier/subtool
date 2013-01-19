require 'simplecov'
SimpleCov.start
SimpleCov.coverage_dir 'coverage/cucumber'

require 'aruba/cucumber'

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
LIB_DIR = File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

Before do
  # Using "announce" causes massive warnings on 1.9.2
  @puts = true
  @original_rubylib = ENV['RUBYLIB']
  ENV['RUBYLIB'] = LIB_DIR + File::PATH_SEPARATOR + ENV['RUBYLIB'].to_s
end

After do
  ENV['RUBYLIB'] = @original_rubylib
end

# Starts with cucumber's built-in hashes method and adds a bit more magic:
#
#   * Converts hash keys from stings to symbols
#   * Converts numeric values into integers
#   * Converts true/false strings into actual booleans
#
def hasherize(table)
  table.hashes.map do |object|
    result = {}
    object.each do |attribute, value|
      object[attribute] = to_boolean?(value)
      object[attribute] = to_float?(object[attribute])
      object[attribute] = to_integer?(object[attribute])
      result[symbolize(attribute)] = object.delete(attribute) unless attribute.is_a?(Symbol)
    end
    result
  end
end

private

# Converts human readable attribute names (e.g. 'transaction type') into rails-ready
# symbolized hash keys (e.g. :transaction type).
#
def symbolize(string)
  string.to_sym
end

# Checks if the passed value contains only digits and underscores.
#
def to_integer?(value)
  value.is_a?(String) && value.match(/^[\d_]+$/) ? value.to_i : value
end

def to_float?(value)
  value.is_a?(String) && value.match(/^[\d_]+\.[\d_]+$/) ? Float(value) : value
end

# Converts true/false/t/f strings into proper booleans.
#
def to_boolean?(value)
  value.is_a?(String) && value.strip.match(/^(t|f|true|false)$/i) ? !!(value =~ /t|true/i) : value
end