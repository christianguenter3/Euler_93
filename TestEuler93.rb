require_relative 'Euler93'
require 'test/unit'

class TestEuler93 < Test::Unit::TestCase
  def test_arith_exp
    assert_equal(28,@euler93.arith_exp("1234"))
  end
  
  TEST_MERGE = { ["1234","+++","XXXXXXX"] => "1.0+2.0+3.0+4.0",
                 ["9328","/*-","XXXXXXX"] => "9.0/3.0*2.0-8.0",
                 ["9328","/*-","XX(XX(XXX))"] => "9.0/(3.0*(2.0-8.0))"}
  
  def test__merge_num_and_op
    TEST_MERGE.each{|input,output| assert_equal(output,@euler93._merge_num_and_op(input[0],input[1],input[2]))}
  end
  
  def test_get_max
    assert_equal(51.0,"1258",@euler93.get_max)
  end
  
  def setup 
    @euler93 = Euler93.new
  end
end
