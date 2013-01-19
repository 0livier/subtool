module Subtool
  module Filter
    class Delay

      def self.add_to(subtitles, seconds)
        subtitles.map do |subtitle|
          subtitle.add_delay(seconds)
          subtitle
        end
      end

    end
  end
end
