class Tweet < ActiveRecord::Base

  StreetHeart = "StreetHeart_"
  
  """Connect to the Twitter API and pull down the latest tweets"""
  def self.get_latest
    tweets = client.statuses.user_timeline? :screen_name => StreetHeart # hit the API
    tweets.each do |t|
      created = DateTime.parse(t.created_at)
      # create the tweet if it doesn't already exist
      unless Tweet.exists?(["created=?", created])
        Tweet.create({:content => t.text, :created => created })
       end
    end
  end
  
  private
  def self.client
    Twitter::Client.new(:auth=>{
      :type=>:oauth,
      :consumer_key=>'urVlC6l3NKxIvYyshw9GKw',
      :consumer_secret=>'e1j5thkhcqwPtOKpLlwJI6EN3yMuGZNRHQd9PmMwCg',
      :token=>"418637795-ZYb1alsWkHM9kY3TLfBYsfs92xmV7VUfeMr6lebn",
      :token_secret=>"B0ysfUMv42qJvtS38p97sM2hwdh5OKMWEyLm09Z44"
    })

  end
end