require File.expand_path(File.dirname(__FILE__) + '/edgecase')

C = "Tepe noktası"

class AboutConstants < EdgeCase::Koan

  C = "içerdeki"

  def test_nested_constants_may_also_be_referenced_with_relative_paths
    assert_equal __, C
  end

  def test_top_level_constants_are_referenced_by_double_colons
    assert_equal __, ::C
  end

  def test_nested_constants_are_referenced_by_their_complete_path
    assert_equal __, AboutConstants::C
    assert_equal __, ::AboutConstants::C
  end

  # ------------------------------------------------------------------

  class Animal
    AYAK_SAYISI = 4
    def legs_in_animal
      AYAK_SAYISI
    end

    class NestedAnimal
      def legs_in_nested_animal
        AYAK_SAYISI
      end
    end
  end

  def test_nested_classes_inherit_constants_from_enclosing_classes
    assert_equal __, Animal::NestedAnimal.new.legs_in_nested_animal
  end

  # ------------------------------------------------------------------

  class Reptile < Animal
    def legs_in_reptile
      AYAK_SAYISI
    end
  end

  def test_subclasses_inherit_constants_from_parent_classes
    assert_equal __, Reptile.new.legs_in_reptile
  end

  # ------------------------------------------------------------------

  class MyAnimals
    AYAK_SAYISI = 2

    class Bird < Animal
      def legs_in_bird
        AYAK_SAYISI
      end
    end
  end

  def test_who_wins_with_both_nested_and_inherited_constants
    assert_equal __, MyAnimals::Bird.new.legs_in_bird
  end

  # SORU: Hangisi önceliklidir: Sınıf sabiti mi,
  # yoksa ata sınıftan alınan sabit mi?

  # ------------------------------------------------------------------

  class MyAnimals::Oyster < Animal
    def legs_in_oyster
      AYAK_SAYISI
    end
  end

  def test_who_wins_with_explicit_scoping_on_class_definition
    assert_equal __, MyAnimals::Oyster.new.legs_in_oyster
  end

  # SORU: Şimdi hangisi öncelikli: Sınıf sabiti mi,
  # yoksa ata sınıftan alınan sabit mi?  
  # Bir önceki cevaptan farklı olmasının sebepleri neler?
end
