require 'net/http'

class ScheduleDownloader
  def self.download (url, filename)
    resp = Net::HTTP.get_response(url)
    puts File.write(filename, resp.body)
  end
end
