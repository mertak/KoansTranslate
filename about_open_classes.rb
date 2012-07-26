require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutOpenClasses < EdgeCase::Koan
  class Dog
    def bark
      "HAV"
    end
  end

  def test_as_defined_dogs_do_bark
    karabas = Dog.new
    assert_equal __, karabas.bark
  end

  # ------------------------------------------------------------------

  # Varolan Dog sınıfını açıp içine yeni bir metod ekleyin.
  class Dog
    def wag
      "MUTLU"
    end
  end

  def test_after_reopening_dogs_can_both_wag_and_bark
    karabas = Dog.new
    assert_equal __, karabas.wag
    assert_equal __, karabas.bark
  end

  # ------------------------------------------------------------------

  class ::Integer
    def even?
      (self % 2) == 0
    end
  end

  def test_even_existing_built_in_classes_can_be_reopened
    assert_equal __, 1.even?
    assert_equal __, 2.even?
  end

  # NOT: Integer'lardan önce neden :: kullandığımızı anlaman için
  # scope hakkında bilgi edinmelisin.
end
