module Subtool
  module Export
    class Srt

      def self.filehandler(fh, subtitles)
        subtitles.each do |subtitle|
          fh.write self.to_srt_entry(subtitle)
          fh.write "\n\n"
        end
      end

      def self.file(filename, subtitles)
        fh = File.open(filename, 'w')

        self.filehandler(fh, subtitles)

        fh.close
      end

      def self.stdout(subtitles)
        self.filehandler($stdout, subtitles)
      end

      def self.to_srt_entry(subtitle)
        "#{subtitle[:id]}\n#{self.time_to_s(subtitle[:start])} --> #{self.time_to_s(subtitle[:end])}\n#{subtitle[:body]}"
      end

      def self.time_to_s(time)
        hours = sprintf '%02d', time / 3600000
        minutes = sprintf '%02d', (time/60000).modulo(60)
        seconds = sprintf '%02d', (time/1000).modulo(60)
        milliseconds = sprintf '%03d', time.modulo(1000)
        "#{hours}:#{minutes}:#{seconds},#{milliseconds}"
      end

    end
  end
end
