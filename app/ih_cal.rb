require 'net/http'
require 'sinatra'

class IceHouseCalendar < Sinatra::Base

  get '/' do
    if not File.exists? 'tmp/schedule.pdf'
      Net::HTTP.start("somedomain.net") do |http|
        resp = http.get("/flv/sample/sample.flv")
        open("sample.flv", "wb") do |file|
          file.write(resp.body)
        end
      end
      puts "Done."
    end

  end

  run! if app_file == $0
end
