require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutInheritance < EdgeCase::Koan
  class Dog
    attr_reader :isim

    def initialize(name)
      @isim = name
    end

    def bark
      "HAV!"
    end
  end

  class Chihuahua < Dog
    def wag
      :mutlu
    end

    def bark
      "yip"
    end
  end

  def test_subclasses_have_the_parent_as_an_ancestor
    assert_equal __, Chihuahua.ancestors.include?(Dog)
  end

  def test_all_classes_ultimately_inherit_from_object
    assert_equal __, Chihuahua.ancestors.include?(Object)
  end

  def test_subclasses_inherit_behavior_from_parent_class
    ciko = Chihuahua.new("Çiko")
    assert_equal __, ciko.name
  end

  def test_subclasses_add_new_behavior
    ciko = Chihuahua.new("Çiko")
    assert_equal __, ciko.wag

    assert_raise(___) do
      karabas = Dog.new("Karabaş")
      karabas.wag
    end
  end

  def test_subclasses_can_modify_existing_behavior
    ciko = Chihuahua.new("Çiko")
    assert_equal __, ciko.bark

    karabas = Dog.new("Çiko")
    assert_equal __, karabas.bark
  end

  # ------------------------------------------------------------------

  class BullDog < Dog
    def bark
      super + ", HOMURTU"
    end
  end

  def test_subclasses_can_invoke_parent_behavior_via_super
    saldiray = BullDog.new("Saldıray")
    assert_equal __, saldiray.bark
  end

  # ------------------------------------------------------------------

  class GreatDane < Dog
    def growl
      super.bark + ", HOMURTU"
    end
  end

  def test_super_does_not_work_cross_method
    pasa = GreatDane.new("Paşa")
    assert_raise(___) do
      pasa.growl
    end
  end

end
