module Subtool
  class Subtitle < Struct.new(:id, :start, :end, :body)

    def add_delay(amount)
      self[:start] = self[:start] + amount
      self[:end] = self[:end] + amount
    end

  end
end