require 'helper'

class TestClosestFib < Test::Unit::TestCase
  def test_closest_fibonacci
    assert_equal( 0, 1.closest_fibonacci )
    assert_equal( 1, 2.closest_fibonacci )
    assert_equal( 2, 3.closest_fibonacci )
    assert_equal( 13, 14.closest_fibonacci )
    assert_equal( 144, 156.closest_fibonacci )
    assert_equal( 89, 99.closest_fibonacci )
    assert_equal( 956722026041, 956722026042.closest_fibonacci )
    ex = assert_raise(ClosestFib::Error) { 0.closest_fibonacci }
    assert_match( /no fibonacci numbers are negative/, ex.message )
  end
end

