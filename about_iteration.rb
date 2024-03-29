require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutIteration < EdgeCase::Koan

  # -- Bu arada ------------------------------------------------------
  # Ruby 1.8 isimleri dizgi olarak depo eder. Ruby 1.9 ise sembol olarak.
  # Bu yüzden koans'da doğru formata sokabilmek için "as_name" isimli
  # bağımlı bir metod kullanıyoruz."as_name" metodunu metod listelerini
  # karşılaştırırken kullanacağız.

  in_ruby_version("1.8") do
    def as_name(isim)
      isim.to_s
    end
  end

  in_ruby_version("1.9") do
    def as_name(isim)
      isim.to_sym
    end
  end

  # Tamam, şimdi Koans'a dönelim.
  # -------------------------------------------------------------------

  def test_each_is_a_method_on_arrays
    assert_equal __, [].methods.include?(as_name(:each))
  end

  def test_iterating_with_each
    dizi = [1, 2, 3]
    sayac = 0
    dizi.each do |eleman|
      sayac += eleman
    end
    assert_equal __, sayac
  end

  def test_each_can_use_curly_brace_blocks_too
    dizi = [1, 2, 3]
    sayac = 0
    dizi.each { |eleman|
      sayac += eleman
    }
    assert_equal __, sayac
  end

  def test_break_works_with_each_style_iterations
    dizi = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sayac = 0
    dizi.each { |eleman|
      break if eleman > 3
      sayac += eleman
    }
    assert_equal __, sayac
  end

  def test_collect_transforms_elements_of_an_array
    dizi = [1, 2, 3]
    yeni_dizi = dizi.collect { |eleman| eleman + 10 }
    assert_equal __, yeni_dizi

    # NOT: 'map', 'collect' işleminin başka bir adı
    baska_dizi = dizi.map { |eleman| eleman + 10 }
    assert_equal __, baska_dizi
  end

  def test_select_selects_certain_items_from_an_array
    dizi = [1, 2, 3, 4, 5, 6]

    cift_sayilar = dizi.select { |eleman| (eleman % 2) == 0 }
    assert_equal __, cift_sayilar

    # NOT: 'find_all' da 'select' işleminin bir diğer adı
    daha_fazla_cift_sayi = dizi.find_all { |eleman| (eleman % 2) == 0 }
    assert_equal __, daha_fazla_cift_sayi
  end

  def test_find_locates_the_first_element_matching_a_criteria
    dizi = ["Can", "Harun", "Cengizhan", "Temel", "Fethi"]

    assert_equal __, dizi.find { |eleman| eleman.size > 6 }
  end

  def test_inject_will_blow_your_mind
    sonuc = [2, 3, 4].inject(0) { |sayac, eleman| sayac + eleman }
    assert_equal __, sonuc

    sonuc2 = [2, 3, 4].inject(1) { |sayac, eleman| sayac * eleman }
    assert_equal __, sonuc2

    # Ekstra Bilgi:
    # İnject'in işlevini kendi kelimelerinle anlat.
  end

  def test_all_iteration_methods_work_on_any_collection_not_just_arrays
    # Aralıklar da aynı şekilde davranır.
    sonuc = (1..3).map { |eleman| eleman + 10 }
    assert_equal __, sonuc

    # Dosyalar bir çok satır gibi davranır.
    File.open("example_file.txt") do |file|
      buyuk_harfli = file.map { |satir| satir.strip.upcase }
      assert_equal __, buyuk_harfli
    end

    # NOT: Sizde kendi yığınlarınızı each,map, select, vs.
    # kullanarak oluşturabilirsiniz
  end 

  # Bonus Soru:  Önceki alıştırmada şunu denemiştik:
  #
  #   File.open(dosya_adi) do |dosya|
  #     # 'dosya'yı okuyacak kod
  #   end
  #
  # Neden aşağıdaki gibi yapmak yerine yukarıdakini denedik?
  #
  #   dosya = File.open(dosya )
  #   # 'dosya'yı okuyacak kod
  #
  # "AboutSandwichCode" alıştırmasını tamamladığında, cevabını
  # tekrar düşün

end
