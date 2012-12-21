class Twitter::PanelWidget < Apotomo::Widget
  responds_to_event :newTweet, :with => :redraw_list
  has_widgets do
    self << widget("twitter/form", :tweet_form)
  end

  def display
   @tweets = Tweet.all
   render
  end

  #def process_tweet(evt)
  # #Tweet.new(:text => evt[:text]).save
  # #@tweets = Tweet.all
  # #replace :view => :display
  #  @tweet = Tweet.new
  #  @tweet.update_attributes(evt[:tweet])
  #  replace :state => :display
  #end

  def list(tweets)
    render :locals => {:tweets => tweets}
  end

  def redraw_list(evt)
    #replace "##{widget_id} ul", {:state => :list}, Tweet.all

    text = evt[:tweet].text
    render :text => "$(\"##{widget_id} ul\").append(\"<li>#{text}</li>\");"

  end

  #def form
  #  render
  #end


end
