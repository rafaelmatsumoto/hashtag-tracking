namespace :twitter do
    desc "Pull tweets"

    client = Twitter::REST::Client.new do |config|
        config.consumer_key    = ENV.fetch("CONSUMER_KEY")
        config.consumer_secret = ENV.fetch("CONSUMER_SECRET")
        config.access_token    = ENV.fetch("ACCESS_TOKEN")
        config.access_token_secret = ENV.fetch("ACCESS_TOKEN_SECRET")
    end

    def save_tweet(text, published_date, hashtag_id, name, username)
        Tweet.create!(text: text, 
                      published_date: published_date, 
                      hashtag_id: hashtag_id,
                      name: name,
                      username: username)
    end

    task :pull_tweets => :environment do
        @hashtags = Hashtag.all

        @hashtags.each do |hashtag|
            @tweets = client.search("#{hashtag.name} -rt").take(5)

            @tweets.each do |tweet|
                save_tweet(tweet.text, 
                           tweet.created_at, 
                           hashtag.id,
                           tweet.user.name,
                           tweet.user.screen_name)
            end
        end
    end
end