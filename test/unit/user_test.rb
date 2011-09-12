require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_should_not_save_without_a_role
     user = User.new
     assert !user.save
   end
end
