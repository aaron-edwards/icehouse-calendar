require 'net/http'
require 'sinatra'
require_relative 'schedule_downloader'

class IceHouseCalendar < Sinatra::Base

  get '/' do
    file = 'tmp/schedule.pdf'
    
    if not File.exists? file
      puts 'redownloading'
      
      Dir.mkdir('tmp') unless Dir.exists? 'tmp'
      ScheduleDownloader.download(URI('http://www.icehouse.com.au/images/stories/sports_programs_schedule.pdf'), file)
    end

    send_file file, :type => '.pdf'
  end
  run! if app_file == $0
end
