require File.expand_path(File.dirname(__FILE__) + '/edgecase')

def my_global_method(a,b)
  a + b
end

class AboutMethods < EdgeCase::Koan

  def test_calling_global_methods
    sonuc __, my_global_method(2,3)
  end

  def test_calling_global_methods_without_parentheses
    sonuc = my_global_method 2, 3
    assert_equal __, sonuc
  end

  # (NOT: Örnek kod sözdizimsel olarak geçersiz olduğundan dolayı
  # koda eval fonksiyonunu ekliyoruz).
  def test_sometimes_missing_parentheses_are_ambiguous
    eval "assert_equal 5, my_global_method 2, 3" # KONTROL ET
    #
    # Ruby hangisini kastettiğinizi bilmiyor:
    #  
    #   assert_equal(5, my_global_method(2), 3)
    # ya da
    #   assert_equal(5, my_global_method(2, 3))
    #
    # Devam etmek için eval dizgisini tekrar yazın.
    #
  end

  # NOT: Yanlış argüman sayısı SYNTAX hatası değildir ama
  # runtime hatasıdır.
  def test_calling_global_methods_with_wrong_number_of_arguments
    istisna = assert_raise(___) do
      my_global_method
    end
    assert_match(/__/, istisna.message)

    istisna = assert_raise(___) do
      my_global_method(1,2,3)
    end
    assert_match(/__/, istisna.message)
  end

  # ------------------------------------------------------------------

  def method_with_defaults(a, b=:varsayilan_deger)
    [a, b]
  end

  def test_calling_with_default_values
    assert_equal [1, __], method_with_defaults(1)
    assert_equal [1, __], method_with_defaults(1, 2)
  end

  # ------------------------------------------------------------------

  def method_with_var_args(*argumanlar)
    argumanlar
  end

  def test_calling_with_variable_arguments
    assert_equal __, method_with_var_args.class
    assert_equal __, method_with_var_args
    assert_equal __, method_with_var_args(:bir)
    assert_equal __, method_with_var_args(:bir, :iki)
  end

  # ------------------------------------------------------------------

  def method_with_explicit_return
    :dondurulmeyen_deger
    return :dondurulen_deger
    :diger_dondurulmeyen_deger
  end

  def test_method_with_explicit_return
    assert_equal __, method_with_explicit_return
  end

  # ------------------------------------------------------------------

  def method_without_explicit_return
    :dondurulmeyen_deger
    :dondurulen_deger
  end

  def test_method_without_explicit_return
    assert_equal __, method_without_explicit_return
  end

  # ------------------------------------------------------------------

  def my_method_in_the_same_class(a, b)
    a * b
  end

  def test_calling_methods_in_same_class
    assert_equal __, my_method_in_the_same_class(3,4)
  end

  def test_calling_methods_in_same_class_with_explicit_receiver
    assert_equal __, self.my_method_in_the_same_class(3,4)
  end

  # ------------------------------------------------------------------

  def my_private_method
    "bu bir sır"
  end
  private :my_private_method

  def test_calling_private_methods_without_receiver
    assert_equal __, my_private_method
  end

  def test_calling_private_methods_with_an_explicit_receiver
    istisna = assert_raise(___) do
      self.my_private_method
    end
    assert_match /__/, istisna.message
  end

  # ------------------------------------------------------------------

  class Dog
    def name
      "Karabaş"
    end

    private

    def tail
      "kuyruk"
    end
  end

  def test_calling_methods_in_other_objects_require_explicit_receiver
    rambo = Dog.new
    assert_equal __, rambo.name
  end

  def test_calling_private_methods_in_other_objects
    rambo = Dog.new
    assert_raise(___) do
      rambo.tail
    end
  end
end
