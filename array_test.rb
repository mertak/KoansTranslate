require 'test_helper'

class ArrayTest < EdgeCase::TestCase

  def test_basic_arrays
    yiyecek = [:fistik, :dag, :ve, :recel]
    assert_equal __, yiyecek[0]
    assert_equal __, yiyecek.size
  end

  def test_array_access
    yiyecek = [:fistik, :dag, :ve, :recel]
    assert_equal __, yiyecek.first
    assert_equal __, yiyecek.last
    assert_equal __, yiyecek[0]
    assert_equal __, yiyecek[2]
    assert_equal __, yiyecek[(yiyecek.size() - 1)]
  end

  def test_arrays_with_other_objects
    yiyecek = [:fistik, :dag, :ve, :recel, 1, nil]
    assert_equal __, yiyecek.size
    assert_equal __, yiyecek.last
    assert_equal __, yiyecek[5]
  end

  def test_adding_to_an_array_with_shovel_shovel
    yiyecek = [:fistik, :dag, :ve, :recel]
    yiyecek << 'sandviç'
    assert_equal __, yiyecek.size
    assert_equal __, yiyecek.first
  end

  def test_adding_to_an_array_with_push
    yiyecek = [:fistik, :dag, :ve, :recel]
    yiyecek.push('sandviç')
    assert_equal __, yiyecek.last
  end

  def test_adding_to_an_array_with_unshift
    yiyecek = [:fistik, :dag, :ve, :recel]
    yiyecek.unshift('a')
    assert_equal __, yiyecek.first
  end

end

