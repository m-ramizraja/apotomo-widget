class TweetWidget < Apotomo::Widget
  responds_to_event :heart, :with => :toggle
  def display
    @tweet = options[:tweet]
    render
  end

  def toggle(evt)
    @tweet = Tweet.find(evt[:id])
    @tweet.toggle! :loved

    replace :view => :display
  end
end
