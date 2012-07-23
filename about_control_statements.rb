require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutControlStatements < EdgeCase::Koan

  def test_if_then_else_statements
    if true
      sonuc = :dogru_deger
    else
      sonuc = :yanlis_deger
    end
    assert_equal __, sonuc
  end

  def test_if_then_statements
    sonuc = :varsayilan_deger
    if true
      sonuc = :dogru_deger
    end
    assert_equal __, sonuc
  end

  def test_if_statements_return_values
    deger = if true
              :dogru_deger
            else
              :yanlis_deger
            end
    assert_equal __, deger

    deger = if false
              :dogru_deger
            else
              :yanlis_deger
            end
    assert_equal __, deger

    # NOT: Aslında Ruby'de yalnızca if ifadeleri bir değer döndürmez,
    # BÜTÜN ifadeler birer değer döndürür.
  end

  def test_if_statements_with_no_else_with_false_condition_return_value
    deger = if false
              :dogru_deger
            end
    assert_equal __, deger
  end

  def test_condition_operators
    assert_equal __, (true ? :dogru_deger : :yanlis_deger)
    assert_equal __, (false ? :dogru_deger : :yanlis_deger)
  end

  def test_if_statement_modifiers
    sonuc = :varsayilan_deger
    sonuc = :dogru_deger if true

    assert_equal __, sonuc
  end

  def test_unless_statement
    sonuc = :varsayilan_deger
    unless false    # 'if !false' demekle aynı şey, 'if true' gibi değerlendirir.
      sonuc = :yanlis_deger
    end
    assert_equal __, sonuc
  end

  def test_unless_statement_evaluate_true
    sonuc = :varsayilan_deger
    unless true    #'if !true' demekle aynı şey,'if false' gibi değerlendirir.
      sonuc = :dogru_deger
    end
    assert_equal __, sonuc
  end

  def test_unless_statement_modifier
    sonuc = :varsayilan_deger
    sonuc = :yanlis_deger unless false

    assert_equal __, sonuc
  end

  def test_while_statement
    i = 1
    sonuc = 1
    while i <= 10
      sonuc = sonuc * i
      i += 1
    end
    assert_equal __, sonuc
  end

  def test_break_statement
    i = 1
    sonuc = 1
    while true
      break unless i <= 10
      sonuc = sonuc * i
      i += 1
    end
    assert_equal __, sonuc
  end

  def test_break_statement_returns_values
    i = 1
    sonuc = while i <= 10
      break i if i % 2 == 0
      i += 1
    end

    assert_equal __, sonuc
  end

  def test_next_statement
    i = 0
    sonuc = []
    while i < 10
      i += 1
      next if (i % 2) == 0
      sonuc << i
    end
    assert_equal __, sonuc
  end

  def test_for_statement
    dizi = ["balik", "ve", "yem"]
    sonuc = []
    for item in dizi
      sonuc << item.upcase
    end
    assert_equal [__, __, __], sonuc
  end

end
