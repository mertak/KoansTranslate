require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutModules < EdgeCase::Koan
  module Nameable
    def set_name(new_name)
      @isim = new_name
    end

    def here
      :modul_icinde
    end
  end

  def test_cant_instantiate_modules
    assert_raise(___) do
      Nameable.new
    end
  end

  # ------------------------------------------------------------------

  class Dog
    include Nameable

    attr_reader :isim

    def initialize
      @isim = "Karabas"
    end

    def bark
      "HAV"
    end

    def here
      :nesne_icinde
    end
  end

  def test_normal_methods_are_available_in_the_object
    karabas = Dog.new
    assert_equal __, karabas.bark
  end

  def test_module_methods_are_also_available_in_the_object
    karabas = Dog.new
    assert_nothing_raised(Exception) do
      karabas.set_name("Rambo")
    end
  end

  def test_module_methods_can_affect_instance_variables_in_the_object
    karabas = Dog.new
    assert_equal __, karabas.name
    karabas.set_name("Rambo")
    assert_equal __, karabas.name
  end

  def test_classes_can_override_module_methods
    karabas = Dog.new
    assert_equal __, karabas.here
  end
end
