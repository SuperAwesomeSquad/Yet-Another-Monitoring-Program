require 'test_helper'

class MonitorControllerTest < ActiveSupport::TestCase
  test "monitors" do
    assert_equal 6, monitors.count
  end
end