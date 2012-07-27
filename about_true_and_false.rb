require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutTrueAndFalse < EdgeCase::Koan
  def truth_value(condition)
    if condition
      :dogru_seyler
    else
      :yanlis_seyler
    end
  end

  def test_true_is_treated_as_true
    assert_equal :dogru_seyler, truth_value(true)
  end

  def test_false_is_treated_as_false
    assert_equal :yanlis_seyler, truth_value(false)
  end

  def test_nil_is_treated_as_false_too
    assert_equal :yanlis_seyler, truth_value(nil)
  end

  def test_everything_else_is_treated_as_true
    assert_equal :dogru_seyler, truth_value(1)
    assert_equal :dogru_seyler, truth_value(0)
    assert_equal :dogru_seyler, truth_value([])
    assert_equal :dogru_seyler, truth_value({})
    assert_equal :dogru_seyler, truth_value("Dizgiler")
    assert_equal :dogru_seyler, truth_value("")
  end

end
