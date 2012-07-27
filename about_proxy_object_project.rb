require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# Proje: Bir Proxy Sınıfı Oluştur
#
# Bu örnekte bir proxy sınıfı oluşturacağız (birini aşağıda senin için
# yaptık).  Proxy nesnesini başka nesnelerle bağdaştırmayı yapabiliyor
# olmalısın. Proxy nesnesine yollanan her mesaj hedef nesneye etki edecektir.
#  Her mesaj yollandığında proxy yollanan metodun ismini
# kaydedecektir.
#
# Proxy sınıfı senin için başlatıldı.  Şimdi method_missing gibi bir metod
# ve daha başka destekleyici metodlar yazabilirsin.  Proxy Class'ın
# ayrıntılı özellikleri AboutProxyObjectProject kısmında verilmiştir.

class Proxy
  def initialize(target_object)
    @nesne = target_object
    # BURAYA DAHA FAZLA KOD EKLE
  end

  # KODU BURAYA YAZ
end

# Proxy nesnesi aşağıdaki testi geçebilmeli:
#
class AboutProxyObjectProject < EdgeCase::Koan
  def test_proxy_method_returns_wrapped_object
    # NOT: The Television sınıfı aşağıda tanımlandı
    tv = Proxy.new(Television.new)

    # İPUCU: Proxy sınıfı yukarıda tanımlandı, belki biraz düzeltmek gerekir...

    assert tv.instance_of?(Proxy)
  end

  def test_tv_methods_still_perform_their_function
    tv = Proxy.new(Television.new)

    tv.kanal = 10
    tv.ac_kapa

    assert_equal 10, tv.kanal
    assert tv.on?
  end

  def test_proxy_records_messages_sent_to_tv
    tv = Proxy.new(Television.new)

    tv.ac_kapa
    tv.kanal = 10

    assert_equal [:ac_kapa, :kanal=], tv.messages
  end

  def test_proxy_handles_invalid_messages
    tv = Proxy.new(Television.new)

    assert_raise(NoMethodError) do
      tv.no_such_method
    end
  end

  def test_proxy_reports_methods_have_been_called
    tv = Proxy.new(Television.new)

    tv.ac_kapa
    tv.ac_kapa

    assert tv.called?(:ac_kapa)
    assert ! tv.called?(:kanal)
  end

  def test_proxy_counts_method_calls
    tv = Proxy.new(Television.new)

    tv.ac_kapa
    tv.kanal = 48
    tv.ac_kapa

    assert_equal 2, tv.number_of_times_called(:ac_kapa)
    assert_equal 1, tv.number_of_times_called(:kanal=)
    assert_equal 0, tv.number_of_times_called(:on?)
  end

  def test_proxy_can_record_more_than_just_tv_objects
    proxy = Proxy.new("Kod Ağacı 2009")

    proxy.upcase!
    result = proxy.split

    assert_equal ["KOD", "AĞACI", "2009"], result
    assert_equal [:upcase!, :split], proxy.messages
  end
end


# ====================================================================
# Devamındaki kodlar Proxy sınıfı testlerini destekleyici kodlardır.
# Bu yorumun altındaki kodlarda bir değişiklik gerekmez.

# Yukarıdaki proxy testi için örnek sınıf.
class Television
  attr_accessor :kanal

  def power
    if @ac_kapa == :on
      @ac_kapa = :off
    else
      @ac_kapa = :on
    end
  end

  def on?
    @ac_kapa == :on
  end
end

# Television sınıfı için testler.  Bu testlerin hepsi geçilmeli.
class TelevisionTest < EdgeCase::Koan
  def test_it_turns_on
    tv = Television.new

    tv.ac_kapa
    assert tv.on?
  end

  def test_it_also_turns_off
    tv = Television.new

    tv.ac_kapa
    tv.ac_kapa

    assert ! tv.on?
  end

  def test_edge_case_on_off
    tv = Television.new

    tv.ac_kapa
    tv.ac_kapa
    tv.ac_kapa

    assert tv.on?

    tv.ac_kapa

    assert ! tv.on?
  end

  def test_can_set_the_channel
    tv = Television.new

    tv.kanal = 11
    assert_equal 11, tv.kanal
  end
end
