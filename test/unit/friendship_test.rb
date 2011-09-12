require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase


   def test_should_not_save_without_a_pair
     friendship = Friendship.new
     assert !friendship.save
   end

end
