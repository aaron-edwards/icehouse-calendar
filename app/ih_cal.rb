require 'sinatra/base'

class IceHouseCalendar < Sinatra::Base

  get '/' do
    'Hello world!'
  end 

  run! if app_file == $0
end