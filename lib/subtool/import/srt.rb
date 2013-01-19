module Subtool
  module Import
    class Srt

      def self.filehandler(fh)
        subtitles = []

        until fh.eof? do

          number = Integer(fh.readline.strip)
          position = self.parse_position(fh.readline.strip)
          body = fh.readline("\n\n").strip

          subtitles.push(Subtool::Subtitle.new(number, position[:start], position[:end], body))
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
        matches = matches[1..8].map { |s| Integer(s) }
        {
            :start => matches[0]*60*60*1000 + matches[1]*60*1000 + matches[2]*1000 + matches[3],
            :end => matches[4]*60*60*1000 + matches[5]*60*1000 + matches[6]*1000 + matches[7]
        }
      end

    end
  end
end
