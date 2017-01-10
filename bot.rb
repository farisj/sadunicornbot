require 'twitter'

class DepressedUnicornBot

  def tweet
   composed_tweet
  end

  def composed_tweet
    [subject, action, object, location, closing_remark].join(' ')
  end

  def subject
    random_phrase_from('subjects.txt')
  end

  def action
    random_phrase_from('actions.txt')
  end

  def object
    random_phrase_from('objects.txt')
  end

  def location
    random_phrase_from('locations.txt')
  end

  def closing_remark
    random_phrase_from('closing_remarks.txt')
  end

  def random_phrase_from(filename)
    open("lib/#{filename}").read.split("\n").sample.strip
  end
end

# exit unless ((Time.now.hour % 3) == 0)

sentence = DepressedUnicornBot.new.tweet

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["consumer_key"]
  config.consumer_secret = ENV["consumer_secret"]
  config.access_token = ENV["access_token"]
  config.access_token_secret = ENV["access_token_secret"]
end

client.update(sentence)
