#!/usr/bin/env ruby
# -*- ruby -*-
# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutAsserts < EdgeCase::Koan

  # Gerçekliğin kontrolü için doğruluk ya da yanlışlık üzerine 
  # "asserts" ile düşünmeliyiz.
  def test_assert_truth
    assert false                # This should be true
  end

  # Uygun ifadeler kullanmanız kemale ermenizi kolaylaştırır.
  def test_assert_with_message
    assert false, "Bu kısım doğru('true') olmalı-- bu kısmı düzelt."
  end

  # Gerçeği anlamak için, gerçeklik beklentilerimizi karşılaştırmalıyız.
  def test_assert_equality
    expected_value = __
    actual_value = 1 + 1

    assert expected_value == actual_value
  end

  # Eşitlik ortaya koymanın bazı yolları diğerlerinden daha iyi olabilir.
  def test_a_better_way_of_asserting_equality
    expected_value = __
    actual_value = 1 + 1

    assert_equal expected_value, actual_value
  end

  # Bazen sizden değerler girmenizi isteyeceğiz.
  def test_fill_in_values
    assert_equal __, 1 + 1
  end
end