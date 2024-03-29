# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutHashes < EdgeCase::Koan
  def test_creating_hashes
    bos_sozluk = Hash.new
    assert_equal __, bos_sozluk.class
    assert_equal({}, bos_sozluk)
    assert_equal __, bos_sozluk.size
  end

  def test_hash_literals
    sozluk = { :bir => "uno", :iki => "dos" }
    assert_equal __, sozluk.size
  end

  def test_accessing_hashes
    sozluk = { :bir => "uno", :iki => "dos" }
    assert_equal __, sozluk[:bir]
    assert_equal __, sozluk[:iki]
    assert_equal __, sozluk[:yok]
  end

  def test_accessing_hashes_with_fetch
    sozluk = { :bir => "uno" }
    assert_equal __, sozluk.fetch(:bir)
    assert_raise(___) do
      sozluk.fetch(:yok)
    end

    # DÜŞÜN
    #
    # Sözlük anahtarlarını çağırırken neden #[] yerine #fetch kullanmak isteyesin?
  end

  def test_changing_hashes
    sozluk = { :bir => "uno", :iki => "dos" }
    sozluk[:bir] = "one"

    beklenen = { :bir => __, :iki => "dos" }
    assert_equal __, beklenen == sozluk

    # Bonus Soru: "beklenen" neden tanımladığımızın aksine
    # değişmiş bir şekilde karşımıza çıktı?
  end

  def test_hash_is_unordered
    sozluk1 = { :bir => "uno", :iki => "dos" }
    sozluk2 = { :iki => "dos", :bir => "uno" }

    assert_equal __, sozluk1 == sozluk2
  end

  def test_hash_keys
    sozluk = { :bir => "uno", :iki => "dos" }
    assert_equal __, sozluk.keys.size
    assert_equal __, sozluk.keys.include?(:bir)
    assert_equal __, sozluk.keys.include?(:iki)
    assert_equal __, sozluk.keys.class
  end

  def test_hash_values
    sozluk = { :bir => "uno", :iki => "dos" }
    assert_equal __, sozluk.values.size
    assert_equal __, sozluk.values.include?("uno")
    assert_equal __, sozluk.values.include?("dos")
    assert_equal __, sozluk.values.class
  end

  def test_combining_hashes
    sozluk = { "can" => 53, "hatice" => 20, "batuhan" => 23 }
    yeni_sozluk = sozluk.merge({ "can" => 54, "pelin" => 26 })

    assert_equal __, sozluk != yeni_sozluk

    beklenen = { "can" => __, "hatice" => 20, "batuhan" => 23, "pelin" => __ }
    assert_equal __, beklenen == yeni_sozluk
  end

  def test_default_value
    sozluk1 = Hash.new
    sozluk1[:bir] = 1

    assert_equal __, sozluk1[:bir]
    assert_equal __, sozluk1[:iki]

    sozluk2 = Hash.new("du")
    sozluk2[:bir] = 1

    assert_equal __, sozluk2[:bir]
    assert_equal __, sozluk2[:iki]
  end

  def test_default_value_is_the_same_object
    sozluk = Hash.new([])

    sozluk[:bir] << "uno"
    sozluk[:iki] << "dos"

    assert_equal __, sozluk[:bir]
    assert_equal __, sozluk[:iki]
    assert_equal __, sozluk[:uc]

    assert_equal __, sozluk[:bir].object_id == sozluk[:iki].object_id
  end

  def test_default_value_with_block
    sozluk = Hash.new {|sozluk, key| sozluk[key] = [] }

    sozluk[:bir] << "uno"
    sozluk[:iki] << "dos"

    assert_equal __, sozluk[:bir]
    assert_equal __, sozluk[:iki]
    assert_equal __, sozluk[:uc]
  end
end
