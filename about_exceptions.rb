require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutExceptions < EdgeCase::Koan

  class MySpecialError < RuntimeError
  end

  def test_exceptions_inherit_from_Exception
    assert_equal __(RuntimeError), MySpecialError.ancestors[1]
    assert_equal __(StandardError), MySpecialError.ancestors[2]
    assert_equal __(Exception), MySpecialError.ancestors[3]
    assert_equal __(Object), MySpecialError.ancestors[4]
  end

  def test_rescue_clause
    sonuc = nil
    begin
      fail "Haydaa"
    rescue StandardError => ex
      sonuc = :hata_duzeltildi
    end

    assert_equal __, sonuc

    assert_equal __, ex.is_a?(StandardError), "Standard Error olmalı"
    assert_equal __, ex.is_a?(RuntimeError),  "Runtime Error olmalı"

    assert RuntimeError.ancestors.include?(StandardError), # __
      "RuntimeError, StandardError sınıfının alt sınıfıdır."

    assert_equal __, ex.message
  end

  def test_raising_a_particular_error
    result = nil
    begin
      # 'raise' ve 'fail' eşanlamlıdır.
      raise MySpecialError, "Mesajim"
    rescue MySpecialError => ex
      sonuc = :hata_duzeltildi
    end

    assert_equal __, sonuc
    assert_equal __, ex.message
  end

  def test_ensure_clause
    sonuc = nil
    begin
      fail "Haydaa"
    rescue StandardError => ex
      # burada kod yok
    ensure
      sonuc = :her_zaman_calistir
    end

    assert_equal __, result
  end

  # Bazen, bilinmeyen hakkında bir şeyler bilmemiz gerekir
  def test_asserting_an_error_is_raised # __
    # Sonra araştırmak üzere koyduğumuz bir başlık
    assert_raise(___(MySpecialError)) do
      raise MySpecialError.new("Hata mesajları direkt gösterilebilir.")
    end
  end

end
