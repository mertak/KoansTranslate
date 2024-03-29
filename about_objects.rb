# encoding: utf-8"
require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutObjects < EdgeCase::Koan
  def test_everything_is_an_object
    assert_equal __, 1.is_a?(Object)
    assert_equal __, 1.5.is_a?(Object)
    assert_equal __, "dizgi".is_a?(Object)
    assert_equal __, nil.is_a?(Object)
    assert_equal __, Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal __, 123.to_s
    assert_equal __, nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal __, 123.inspect
    assert_equal __, nil.inspect
  end

  def test_every_object_has_an_id
    nesne = Object.new
    assert_equal __, nesne.object_id.class
  end

  def test_every_object_has_different_id
    nesne = Object.new
    baska_nesne = Object.new
    assert_equal __, nesne.object_id != baska_nesne.object_id
  end

  def test_some_system_objects_always_have_the_same_id
    assert_equal __, false.object_id
    assert_equal __, true.object_id
    assert_equal __, nil.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal __, 0.object_id
    assert_equal __, 1.object_id
    assert_equal __, 2.object_id
    assert_equal __, 100.object_id

    # DÜŞÜN:
    # Fixnum değerlerinin, nesne id'lerinin belirlenmesinde nasıl bir yol izleniyor?
  end

  def test_clone_creates_a_different_object
    nesne = Object.new
    kopya = nesne.clone

    assert_equal __, nesne           != kopya
    assert_equal __, nesne.object_id != kopya.object_id
  end
end
