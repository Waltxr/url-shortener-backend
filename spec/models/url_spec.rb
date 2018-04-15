require 'rails_helper'

RSpec.describe Url, :type => :model do

  it 'Should be invalid with the url google.com' do
    url = Url.new(decoded_url: 'google.com')
    url.should_not be_valid
  end

  it 'Should be invalid with the url asdfasdf' do
    url = Url.new(decoded_url: 'asdfasdf')
    url.should_not be_valid
  end

  it 'Should be invalid with the url http://asdfasdf' do
    url = Url.new(decoded_url: 'http://asdfasdf')
    url.should_not be_valid
  end

  it 'Should be invalid with the url http://' do
    url = Url.new(decoded_url: 'http://')
    url.should_not be_valid
  end

  it 'Should be invalid with the url http://http://google.com' do
    url = Url.new(decoded_url: 'http://')
    url.should_not be_valid
  end

  it 'Should be valid with the url http://google.com' do
    url = Url.new(decoded_url: 'http://google.com')
    expect(url).to be_valid
  end

  it 'Should be valid with the url https://socket.io/' do
    url = Url.new(decoded_url: 'https://socket.io/')
    expect(url).to be_valid
  end


end
