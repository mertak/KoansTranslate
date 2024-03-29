#!/usr/bin/env ruby
# -*- ruby -*-
# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutAsserts < EdgeCase::Koan

  # Gerçekliğin kontrolü için doğruluk ya da yanlışlık üzerine 
  # "asserts" ile düşünmeliyiz.
  def test_assert_truth
    assert false                # Burası <true> olmalıydı
  end

  # Uygun ifadeler kullanmanız kemale ermenizi kolaylaştırır.
  def test_assert_with_message
    assert false, "Bu kısım doğru('true') olmalı-- bu kısmı düzelt."
  end

  # Gerçeği anlamak için, gerçeklik beklentilerimizi karşılaştırmalıyız.
  def test_assert_equality
    beklenen_deger = __
    gercek_deger = 1 + 1

    assert beklenen_deger == gercek_deger
  end

  # Eşitlik ortaya koymanın bazı yolları diğerlerinden daha iyi olabilir.
  def test_a_better_way_of_asserting_equality
    beklenen_deger = __
    gercek_deger = 1 + 1

    assert_equal beklenen_deger, gercek_deger
  end

  # Bazen sizden değerler girmenizi isteyeceğiz.
  def test_fill_in_values
    assert_equal __, 1 + 1
  end
end
