require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutClasses < EdgeCase::Koan
  class Dog
  end

  def test_instances_of_classes_can_be_created_with_new
    karabas = Dog.new
    assert_equal __, karabas.class
  end

  # ------------------------------------------------------------------

  class Dog2
    def set_name(a_name)
      @isim = a_name
    end
  end

  def test_instance_variables_can_be_set_by_assigning_to_them
    karabas = Dog2.new
    assert_equal __, karabas.instance_variables

    karabas.set_name("Karabaş")
    assert_equal __, karabas.instance_variables
  end

  def test_instance_variables_cannot_be_accessed_outside_the_class
    karabas = Dog2.new
    karabas.set_name("Karabaş")

    assert_raise(___) do
      karabas.name
    end

    assert_raise(___) do
      eval "karabas.@isim"
      # NOT: eval kullanıyoruz çünkü aksi halde syntax hatası alıyoruz.
    end
  end

  def test_you_can_politely_ask_for_instance_variable_values
    karabas = Dog2.new
    karabas.set_name("Karabaş")

    assert_equal __, karabas.instance_variable_get("@isim")
  end

  def test_you_can_rip_the_value_out_using_instance_eval
    karabas = Dog2.new
    karabas.set_name("Karabaş")

    assert_equal __, karabas.instance_eval("@isim")  # dizgi versiyonu
    assert_equal __, karabas.instance_eval { @isim } # blok versiyonu
  end

  # ------------------------------------------------------------------

  class Dog3
    def set_name(a_name)
      @isim = a_name
    end
    def name
      @isim
    end
  end

  def test_you_can_create_accessor_methods_to_return_instance_variables
    karabas = Dog3.new
    karabas.set_name("Karabaş")

    assert_equal __, karabas.name
  end

  # ------------------------------------------------------------------

  class Dog4
    attr_reader :isim

    def set_name(a_name)
      @isim = a_name
    end
  end


  def test_attr_reader_will_automatically_define_an_accessor
    karabas = Dog4.new
    karabas.set_name("Karabaş")

    assert_equal __, karabas.name
  end

  # ------------------------------------------------------------------

  class Dog5
    attr_accessor :isim
  end


  def test_attr_accessor_will_automatically_define_both_read_and_write_accessors
    karabas = Dog5.new

    karabas.name = "Karabaş"
    assert_equal __, karabas.name
  end

  # ------------------------------------------------------------------

  class Dog6
    attr_reader :isim
    def initialize(initial_name)
      @isim = initial_name
    end
  end

  def test_initialize_provides_initial_values_for_instance_variables
    karabas = Dog6.new("Karabaş")
    assert_equal __, karabas.name
  end

  def test_args_to_new_must_match_initialize
    assert_raise(___) do
      Dog6.new
    end
    # DÜŞÜN:
    # Neden böyle?
  end

  def test_different_objects_have_different_instance_variables
    karabas = Dog6.new("Karabaş")
    rambo = Dog6.new("Rambo")

    assert_equal __, rambo.name != karabas.name
  end

  # ------------------------------------------------------------------

  class Dog7
    attr_reader :isim

    def initialize(initial_name)
      @isim = initial_name
    end

    def get_self
      self
    end

    def to_s
      __
    end

    def inspect
      "<Köpeğe '#{name}' ismi verildi.>"
    end
  end

  def test_inside_a_method_self_refers_to_the_containing_object
    karabas = Dog7.new("Karabaş")

    karabasin_kendi = karabas.get_self
    assert_equal __, karabasin_kendi
  end

  def test_to_s_provides_a_string_version_of_the_object
    karabas = Dog7.new("Karabaş")
    assert_equal __, karabas.to_s
  end

  def test_to_s_is_used_in_string_interpolation
    karabas = Dog7.new("Karabaş")
    assert_equal __, "Benim köpeğim #{karabas}"
  end

  def test_inspect_provides_a_more_complete_string_version
    karabas = Dog7.new("Karabaş")
    assert_equal __, karabas.inspect
  end

  def test_all_objects_support_to_s_and_inspect
    dizi = [1,2,3]

    assert_equal __, dizi.to_s
    assert_equal __, dizi.inspect

    assert_equal __, "DİZGİ".to_s
    assert_equal __, "DİZGİ".inspect
  end

end
