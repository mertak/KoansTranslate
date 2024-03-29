require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutSymbols < EdgeCase::Koan
  def test_symbols_are_symbols
    sembol = :ruby
    assert_equal __, sembol.is_a?(Symbol)
  end

  def test_symbols_can_be_compared
    sembol1 = :sembol
    sembol2 = :sembol
    sembol3 = :baska_bir_sey

    assert_equal __, sembol1 == sembol2
    assert_equal __, sembol1 == sembol3
  end

  def test_identical_symbols_are_a_single_internal_object
    sembol1 = :sembol
    sembol2 = :sembol

    assert_equal __, sembol1           == sembol2
    assert_equal __, sembol1.object_id == sembol2.object_id
  end

  def test_method_names_become_symbols
    dizgi_gibi_semboller = Symbol.all_symbols.map { |x| x.to_s }
    assert_equal __, dizgi_gibi_semboller.include?("test_method_names_become_symbols")
  end

  # DÜŞÜN:
  #
  # Neden sembol listesini önce stringe çevirip daha sonra
  # dizgi değerleri ile karşılaştırıyoruz?

  in_ruby_version("mri") do
    RubyConstant = "Alkislarken cikan ses nedir?"
    def test_constants_become_symbols
      butun_semboller = Symbol.all_symbols

      assert_equal __, butun_semboller.include?(__)
    end
  end

  def test_symbols_can_be_made_from_strings
    dizgi = "yarVeDiyar"
    assert_equal __, dizgi.to_sym
  end

  def test_symbols_with_spaces_can_be_built
    sembol = :"yar ve diyar"

    assert_equal sembol, __.to_sym
  end

  def test_symbols_with_interpolation_can_be_built
    deger = "ve"
    sembol = :"yar #{deger} diyar"

    assert_equal sembol, __.to_sym
  end

  def test_to_s_is_called_on_interpolated_symbols
    sembol = :yar
    dizgi = "ana gibi #{sembol} Bagdat gibi diyar olmaz."

    assert_equal __, dizgi
  end

  def test_symbols_are_not_strings
    sembol = :ruby
    assert_equal __, sembol.is_a?(String)
    assert_equal __, sembol.eql?("ruby")
  end

  def test_symbols_do_not_have_string_methods
    sembol = :dizgi_degil
    assert_equal __, sembol.respond_to?(:karakter)
    assert_equal __, sembol.respond_to?(:ters)
  end

  # Sembollerin "sabit dizgiler" olmadıklarını kavrayabilmek
  # önemlidir ancak yine de sabittirler. Dizgilere özgü
  # işlemlerin hiçbiri sembollerde mümkün değildir.

  def test_symbols_cannot_be_concatenated
    # Buradaki hatanın üzerinde daha sonra düşünülecek.
    assert_raise(___) do
      :yar + :diyar
    end
  end

  def test_symbols_can_be_dynamically_created
    assert_equal __, ("yar" + "diyar").to_sym
  end

  # DÜŞÜN:
  #
  # Neden dinamik olarak bir çok sembol yaratmak iyi bir fikir değil?
end
