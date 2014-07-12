require 'spec_helper'
require_relative '../app/schedule_downloader'
require 'webmock/rspec'

describe ScheduleDownloader do

  let(:url) { URI('http://some/url') }
  let(:data) { "some data" }
  let(:filename) { 'some_filename' }

  before(:each) do
    allow(File).to receive(:write)

    stub_request(:get, url).to_return(:body => data)
  end

  it "should make a get request to the provided url" do
    ScheduleDownloader.download(url, filename)
    assert_requested :get, url
  end

  it 'should download the contents of the url to the file provided'do
    expect(File).to receive(:write).with(filename, data)

    ScheduleDownloader.download(url, filename)
    
  end
end
