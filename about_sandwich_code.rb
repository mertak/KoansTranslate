require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutSandwichCode < EdgeCase::Koan

  def count_lines(dosya_adi)
    dosya = open(dosya_adi)
    say = 0
    while satir = dosya.gets
      say += 1
    end
    say
  ensure
    dosya.close if file
  end

  def test_counting_lines
    assert_equal __, count_lines("example_file.txt")
  end

  # ------------------------------------------------------------------

  def find_line(dosya_adi)
    dosya = open(dosya_adi)
    while satir = dosya.gets
      return satir if satir.match(/u/)
    end
  ensure
    dosya.close if dosya
  end

  def test_finding_lines
    assert_equal __, find_line("example_file.txt")
  end

  # ------------------------------------------------------------------
  # DÜŞÜN:
  #
  # count_lines ve find_line benzer aynı zamanda farklıdırlar.
  # İkisi de "sandwich code"'un yolunu takip eder.
  #
  # Sandwich code 3 parçadan oluşur: (1) Üstteki
  # ekmek, (2) et, ve (3) alttaki ekmek. Ekmekler
  # sürekli beraber ilerlerler ama sandviçin ortasındaki
  # et kısmı sürekli değişir.
  #
  # Çünkü sandviçin değişen kısmı sürekli ortadadır,
  # bahsedilen ekmek dilimlerini bir kütüphaneye soyutlamak 
  # bir çok dilde zor bir olaydır.
  #
  # (C++ programcıları: The idiom of capturing allocated
  # pointers in a smart pointer constructor is an attempt to deal with
  # the problem of sandwich code for resource allocation.)
  #
  # Kafan yeterince karıştı
  # Tamam şimdi sakin ol ve aşağıdaki koda bak:
  #

  def file_sandwich(dosya_adi)
    dosya = open(dosya_adi)
    yield(dosya)
  ensure
    dosya.close if dosya
  end

  # Şimdi yazalım:

  def count_lines2(dosya_adi)
    file_sandwich(dosya_adi) do |dosya|
      say = 0
      while satir = dosya.gets
        say += 1
      end
      say
    end
  end

  def test_counting_lines2
    assert_equal __, count_lines2("example_file.txt")
  end

  # ------------------------------------------------------------------

  def find_line2(dosya_adi)
    # find_line'ı, file_sandwich kütüphane fonksiyonlarıyla yeniden yaz.
  end

  def test_finding_lines2
    assert_equal __, find_line2("example_file.txt")
  end

  # ------------------------------------------------------------------

  def count_lines3(dosya_adi)
    open(dosya_adi) do |dosya|
      say = 0
      while satir = dosya.gets
        say += 1
      end
      say
    end
  end

  def test_open_handles_the_file_sandwich_when_given_a_block
    assert_equal __, count_lines3("example_file.txt")
  end

end
