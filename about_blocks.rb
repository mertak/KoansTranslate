require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutBlocks < EdgeCase::Koan
  def method_with_block
    sonuc = yield
    sonuc
  end

  def test_methods_can_take_blocks
    yinelenen_sonuc = method_with_block { 1 + 2 }
    assert_equal __, yinelenen_sonuc
  end

  def test_blocks_can_be_defined_with_do_end_too
    yinelenen_sonuc = method_with_block do 1 + 2 end
    assert_equal __, yinelenen_sonuc
  end

  # ------------------------------------------------------------------

  def method_with_block_arguments
    yield("Can")
  end

  def test_blocks_can_take_arguments
    sonuc = method_with_block_arguments do |arguman|
      assert_equal __, arguman
    end
  end

  # ------------------------------------------------------------------

  def many_yields
    yield(:fistik)
    yield(:yag)
    yield(:ve)
    yield(:recel)
  end

  def test_methods_can_call_yield_many_times
    sonuc = []
    many_yields { |eleman| sonuc << eleman }
    assert_equal __, sonuc
  end

  # ------------------------------------------------------------------

  def yield_tester
    if block_given?
      yield
    else
      :blok_yok
    end
  end

  def test_methods_can_see_if_they_have_been_called_with_a_block
    assert_equal __, yield_tester { :blok_var }
    assert_equal __, yield_tester
  end

  # ------------------------------------------------------------------

  def test_block_can_affect_variables_in_the_code_where_they_are_created
    deger = :ilk_deger
    method_with_block { deger = :blok_icinde_degisti }
    assert_equal __, deger
  end

  def test_blocks_can_be_assigned_to_variables_and_called_explicitly
    bir_ekle = lambda { |n| n + 1 }
    assert_equal __, bir_ekle.call(10)

    # Alternatif dizi çağırımı
    assert_equal __, bir_ekle[10]
  end

  def test_stand_alone_blocks_can_be_passed_to_methods_expecting_blocks
    buyuk_harf_yap = lambda { |n| n.upcase }
    sonuc = method_with_block_arguments(&buyuk_harf_yap)
    assert_equal __, sonuc
  end

  # ------------------------------------------------------------------

  def method_with_explicit_block(&blok)
    blok.call(10)
  end

  def test_methods_can_take_an_explicit_block_argument
    assert_equal __, method_with_explicit_block { |n| n * 2 }

    bir_ekle = lambda { |n| n + 1 }
    assert_equal __, method_with_explicit_block(&bir_ekle)
  end

end
