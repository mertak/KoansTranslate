require File.expand_path(File.dirname(__FILE__) + '/edgecase')

include Java

# Konseptler
# * Java sınıfından bir şeyler çekmek
# * metod çaırmak, Deve vs yılan
# * Modül/sınıf isim çakışmalarını önlemek
# * Ne döndürdüğünü göstermek
# * Ruby Dizgileri  VS Java Dizgileri
# * Java sınıflarını çağırmak
# * Java'dan Ruby'yi çağırmak???

class AboutJavaInterop < EdgeCase::Koan
  def test_using_a_java_library_class
    java_dizisi = java.util.ArrayList.new
    assert_equal __, java_dizisi.class
  end

  def test_java_class_can_be_referenced_using_both_ruby_and_java_like_syntax
    assert_equal __, Java::JavaUtil::ArrayList == java.util.ArrayList
  end

  def test_include_class_includes_class_in_module_scope
    assert_nil defined?(TreeSet)
    include_class "java.util.TreeSet"
    assert_equal __, defined?(TreeSet)
  end

  # DÜŞÜN:
  #
  # Ya şunu kullansaydık:
  #
  #   include_class "java.lang.String"
  #
  # Dizgi sabitinin değer include_class çalıştıktan sonra nasıl
  # olacaktır?  Java sınıflarına farklı isimlerle lakaplar takmamız
  # kullanışlı olacak mıdır?

  JString = java.lang.String
  def test_also_java_class_can_be_given_ruby_aliases
    java_dizgisi = JString.new("Bir Java Dizgisi")
    assert_equal __, java_dizgisi.class
    assert_equal __, JString
  end

  def test_can_directly_call_java_methods_on_java_objects
    java_dizgisi = JString.new("Bir Java Dizgisi")
    assert_equal __, java_dizgisi.toLowerCase
  end

  def test_jruby_provides_snake_case_versions_of_java_methods
    java_dizgisi = JString.new("Bir Java Dizgisi")
    assert_equal __, java_dizgisi.to_lower_case
  end

  def test_jruby_provides_question_mark_versions_of_boolean_methods
    java_dizgisi = JString.new("Bir Java Dizgisi")
    assert_equal __, java_dizgisi.endsWith("Dizgi")
    assert_equal __, java_dizgisi.ends_with("Dizgi")
    assert_equal __, java_dizgisi.ends_with?("Dizgi")
  end

  def test_java_string_are_not_ruby_strings
    ruby_dizgisi = "Bir Java Dizgisi"
    java_dizgisi = java.lang.String.new(ruby_dizgisi)
    assert_equal __, java_dizgisi.is_a?(java.lang.String)
    assert_equal __, java_dizgisi.is_a?(String)
  end

  def test_java_strings_can_be_compared_to_ruby_strings_maybe
    ruby_dizgisi = "Bir Java Dizgisi"
    java_dizgisi = java.lang.String.new(ruby_dizgisi)
    assert_equal __, ruby_dizgisi == java_dizgisi
    assert_equal __, java_dizgisi == ruby_dizgisi

    # DÜŞÜN:
    #
    # Bunun daha da yanlış olması gibi bir ihtimal daha var mı?
    #
    # CİDDEN, BİRAZ KAFA YOR:
    #
    # Neden Ruby ve Java dizgilerini böyle karşılaştırmak zorundasın?
    #
    # KAFA PATLATMA VAKTİ GELDİ:
    #
    # Ruby/Java dizgileri karşılaştırmalarını değiştirebilir(commutative)
    # yapmanın bir yolu var mı?
    # Sen olsan nasıl yapardın?
  end

  def test_however_most_methods_returning_strings_return_ruby_strings
    java_dizisi = java.util.ArrayList.new
    assert_equal __, java_dizisi.toString
    assert_equal __, java_dizisi.toString.is_a?(String)
    assert_equal __, java_dizisi.toString.is_a?(java.lang.String)
  end

  def test_some_ruby_objects_can_be_coerced_to_java
    assert_equal __, "ruby dizgisi".to_java.class
    assert_equal __, 1.to_java.class
    assert_equal __, 9.32.to_java.class
    assert_equal __, false.to_java.class
  end

  def test_some_ruby_objects_are_not_coerced_to_what_you_might_expect
    assert_equal __, [].to_java.class == Java::JavaUtil::ArrayList
    assert_equal __, {}.to_java.class == Java::JavaUtil::HashMap
    assert_equal __, Object.new.to_java.class == Java::JavaLang::Object
  end

  def test_java_collections_are_enumerable
    java_dizisi = java.util.ArrayList.new
    java_dizisi << "bir" << "iki" << "üç"
    assert_equal __, java_dizisi.map { |eleman| eleman.upcase }
  end

  # ------------------------------------------------------------------

  # Java'da ArrayList'i(Diziler Listesi) açıp yeni bir metod ekle.
  class Java::JavaUtil::ArrayList
    def multiply_all
      sonuc = 1
      each do |eleman|
        sonuc *= eleman
      end
      sonuc
    end
  end

  def test_java_class_are_open_from_ruby
    java_dizisi = java.util.ArrayList.new
    java_dizisi.add_all([1,2,3,4,5])

    assert_equal __, java_dizisi.multiply_all
  end

end
