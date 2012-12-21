require 'test_helper'

class TrashbinWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:trashbin)
  end
  
  test "display" do
    render_widget :trashbin
    assert_select "h1"
  end
end
