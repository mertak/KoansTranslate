require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutMessagePassing < EdgeCase::Koan

  class MessageCatcher
    def caught?
      true
    end
  end

  def test_methods_can_be_called_directly
    mc = MessageCatcher.new

    assert mc.caught?
  end

  def test_methods_can_be_invoked_by_sending_the_message
    mc = MessageCatcher.new

    assert mc.send(:caught?)
  end

  def test_methods_can_be_invoked_more_dynamically
    mc = MessageCatcher.new

    assert mc.send("yakaladı mı?")
    assert mc.send("yakalandı" + __ )    # İlk dizgiye ne eklemelisin?
    assert mc.send("YAKALANDI?".____ )      # Dizgiye ne yapmalısın?
  end

  def test_send_with_underscores_will_also_send_messages
    mc = MessageCatcher.new

    assert_equal __, mc.__send__(:caught?)

    # DÜŞÜN:
    #
    # Neden Ruby ikisini de (send ve __send__)  destekliyor ?
  end

  def test_classes_can_be_asked_if_they_know_how_to_respond
    mc = MessageCatcher.new

    assert_equal __, mc.respond_to?(:caught?)
    assert_equal __, mc.respond_to?(:boyle_bir_sey_yok)
  end

  # ------------------------------------------------------------------

  class MessageCatcher
    def add_a_payload(*args)
      args
    end
  end

  def test_sending_a_message_with_arguments
    mc = MessageCatcher.new

    assert_equal __, mc.add_a_payload
    assert_equal __, mc.send(:add_a_payload)

    assert_equal __, mc.add_a_payload(3, 4, nil, 6)
    assert_equal __, mc.send(:add_a_payload, 3, 4, nil, 6)
  end

  # ------------------------------------------------------------------

  class TypicalObject
  end

  def test_sending_undefined_messages_to_a_typical_object_results_in_errors
    typical = TypicalObject.new

    istisna = assert_raise(___) do
      typical.foobar
    end
    assert_match(/foobar/, istisna.message)
  end

  def test_calling_method_missing_causes_the_no_method_error
    typical = TypicalObject.new

    istisna = assert_raise(___) do
      typical.method_missing(:foobar)
    end
    assert_match(/foobar/, istisna.message)

    # DÜŞÜN:
    #
    # Eğer :method_missing metodu NoMethodError hatasına sebep olursa
    # ve method_missing metodunu yeniden tanımlarsak ne olur?
    #
    # NOT:
    #
    # Ruby 1.8'de method_missing metodu açık(public) ve kolayca çağırılabilir,
    # lakin Ruby 1.9'da bu metod özel (private).
    #  Biz burada framework üzerinde test ederek onu açık(public) yapıyoruz ki
    # bu şekilde Ruby'nin iki versiyonunda da çalışabilsin. Sadece aklında bulunsun
    # Ruby 1.9'da normal şartlarda method_missing metodunu bu şekilde çağırıp
    # kullanamazsın.
    #
    # Teşekkürler. Şimdi planladığımız üzere Ruby Koans'a dönelim.
  end

  # ------------------------------------------------------------------

  class AllMessageCatcher
    def method_missing(method_name, *args, &block)
      "Birisi #{method_name} metodunu şunlarla çağırdı <#{args.join(", ")}>"
    end
  end

  def test_all_messages_are_caught
    yakalayici = AllMessageCatcher.new

    assert_equal __, yakalayici.foobar
    assert_equal __, yakalayici.foobaz(1)
    assert_equal __, yakalayici.sum(1,2,3,4,5,6)
  end

  def test_catching_messages_makes_respond_to_lie
    yakalayici = AllMessageCatcher.new

    assert_nothing_raised(NoMethodError) do
      yakalayici.any_method
    end
    assert_equal __, yakalayici.respond_to?(:any_method)
  end

  # ------------------------------------------------------------------

  class WellBehavedFooCatcher
    def method_missing(method_name, *args, &block)
      if method_name.to_s[0,3] == "foo"
        "Sana da foo o zaman."
      else
        super(method_name, *args, &block)
      end
    end
  end

  def test_foo_method_are_caught
    yakalayici = WellBehavedFooCatcher.new

    assert_equal __, yakalayici.foo_bar
    assert_equal __, yakalayici.foo_baz
  end

  def test_non_foo_messages_are_treated_normally
    yakalayici = WellBehavedFooCatcher.new

    assert_raise(___) do
      yakalayici.normal_undefined_method
    end
  end

  # ------------------------------------------------------------------

  # (not: just reopening class from above)
  class WellBehavedFooCatcher
    def respond_to?(method_name)
      if method_name.to_s[0,3] == "foo"
        true
      else
        super(method_name)
      end
    end
  end

  def test_explicitly_implementing_respond_to_lets_objects_tell_the_truth
    yakalayici = WellBehavedFooCatcher.new

    assert_equal __, yakalayici.respond_to?(:foo_bar)
    assert_equal __, yakalayici.respond_to?(:baska_bir_sey)
  end

end
