class TrashbinWidget < Apotomo::Widget
  responds_to_event :trash

  def display
    render
  end

  def trash(evt)
    Tweet.find(evt[:id]).delete
    trigger :tweetDeleted

    update :view => :display
  end
end
