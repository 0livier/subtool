module Subtool
  module Import
    class Srt

      HOUR = 60 * 60 * 1000
      MIN = 60 * 1000
      SEC = 1000

      def self.filehandler(fh)
        subtitles = []
        until fh.eof? do

          number = Integer(fh.readline.strip)
          position = self.parse_position(fh.readline.strip)
          body = ""
          while (! fh.eof?) && ("" != (content = fh.readline.strip))
            body = body + content + "\n"
          end

          subtitles.push(Subtool::Subtitle.new(number, position[:start], position[:end], body.strip))
        end

        subtitles
      end

      def self.file(filename)
        fh = File.open(filename)
        subtitles = self.filehandler(fh)
        fh.close

        subtitles
      end

      def self.parse_position(position)
        matches = position.match(/^(\d\d):(\d\d):(\d\d),(\d\d\d) --> (\d\d):(\d\d):(\d\d),(\d\d\d)$/)
        throw Exception.new("Can't parse #{position} as a valid time range") unless matches

        matches = matches[1..8].map { |s| s.to_i }
        {
            :start => self.to_millisecs(matches[0], matches[1], matches[2], matches[3]),
            :end => self.to_millisecs(matches[4], matches[5], matches[6], matches[7]),
        }
      end

      private

      def self.to_millisecs(hour, min, sec, millisec)
        return hour * HOUR + min * MIN + sec * SEC + millisec
      end

    end
  end
end
