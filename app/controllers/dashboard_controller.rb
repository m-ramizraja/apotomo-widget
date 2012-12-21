class DashboardController < ApplicationController
  has_widgets do |root|
    #root << widget("twitter/panel", :twitter)
    #root << widget("twitter/form",  :tweet_form)

    root << panel = widget("twitter/panel", :twitter)

    root << widget('twitter', :twitt)
    root << widget('trashbin', :trash)
    root.respond_to_event :tweetDeleted, :with => :redraw, :on => :twitt

  end

  def index
  end

  def love
  end
end
