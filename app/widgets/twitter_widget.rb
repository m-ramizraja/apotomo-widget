class TwitterWidget < Apotomo::Widget
  responds_to_event :submit, :with => :process_tweet
  responds_to_event :tweetDeleted, :with => :redraw

  #after_add do
  #  root.respond_to_event :tweetDeleted, :with => :redraw, :on => widget_id
  #end

  has_widgets do
    for t in Tweet.all
      self << widget(:tweet, "tweet-#{t.id}", :tweet => t)
    end
  end
  def display
    render
  end
  def process_tweet(evt)
    Tweet.new(:text => evt[:text]).save

    @tweets = Tweet.all # this is wet!
    replace :view => :display
  end

  def redraw(evt)
    replace "##{widget_id} ul", {:state => :list}, Tweet.all
  end
  def list(tweets)
    render :locals => {:tweets => tweets}
  end

end