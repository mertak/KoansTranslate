# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutNil < EdgeCase::Koan
  def test_nil_is_an_object
    assert_equal __, nil.is_a?(Object), "Diğer programlama dillerindeki NULL karakteri."
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # Varolmayan bir metod çağırıldığında ne olur? Begin/rescue/end
    # kod blokları hatayı yakalar ve
    # bununla ilgili kararı verir.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # Hangi hata mesajını aldınız ?
      assert_equal __, ex.class

      # Hataya eklenmiş mesaj neydi ?
      # (İPUCU: __ yerine hata mesajının açıklamasını yazın.)
      assert_match(/__/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert_equal __, nil.nil?
    assert_equal __, nil.to_s
    assert_equal __, nil.inspect

    # DÜŞÜN:
    #
    # Hangisini kullanmak daha iyi
    #    obj.nil?
    # mi yoksa
    #    obj == nil
    # mi? Neden?
  end

end
