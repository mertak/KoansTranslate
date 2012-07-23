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
    sozluk = { :bir => "yek", :iki => "dü" }
    assert_equal __, sozluk.size
  end

  def test_accessing_hashes
    sozluk = { :bir => "yek", :iki => "dü" }
    assert_equal __, sozluk[:bir]
    assert_equal __, sozluk[:iki]
    assert_equal __, sozluk[:yok]
  end

  def test_accessing_hashes_with_fetch
    sozluk = { :bir => "yek" }
    assert_equal __, sozluk.fetch(:bir)
    assert_raise(___) do
      sozluk.fetch(:yok)
    end

    # DÜŞÜN
    #
    # Sözlük anahtarlarını çağırırken neden #[] yerine #fetch kullanmak isteyesin?
  end

  def test_changing_hashes
    sozluk = { :bir => "yek", :iki => "dü" }
    sozluk[:bir] = "one"

    beklenen = { :bir => __, :iki => "dü" }
    assert_equal __, beklenen == sozluk

    # Bonus Soru: "beklenen" neden tanımladığımızın aksine
    # değişmiş bir şekilde karşımıza çıktı?
  end

  def test_hash_is_unordered
    sozluk1 = { :bir => "yek", :iki => "dü" }
    sozluk2 = { :iki => "dü", :bir => "yek" }

    assert_equal __, sozluk1 == sozluk2
  end

  def test_hash_keys
    sozluk = { :bir => "yek", :iki => "dü" }
    assert_equal __, sozluk.keys.size
    assert_equal __, sozluk.keys.include?(:bir)
    assert_equal __, sozluk.keys.include?(:iki)
    assert_equal __, sozluk.keys.class
  end

  def test_hash_values
    sozluk = { :bir => "yek", :iki => "dü" }
    assert_equal __, sozluk.values.size
    assert_equal __, sozluk.values.include?("yek")
    assert_equal __, sozluk.values.include?("dü")
    assert_equal __, sozluk.values.class
  end

  def test_combining_hashes
    sozluk = { "jim" => 53, "amy" => 20, "dan" => 23 }
    yeni_sozluk = sozluk.merge({ "jim" => 54, "jenny" => 26 })

    assert_equal __, sozluk != yeni_sozluk

    beklenen = { "jim" => __, "amy" => 20, "dan" => 23, "jenny" => __ }
    assert_equal __, beklenen == yeni_sozluk
  end

  def test_default_value
    sozluk1 = Hash.new
    sozluk1[:bir] = 1

    assert_equal __, sozluk1[:bir]
    assert_equal __, sozluk1[:iki]

    sozluk2 = Hash.new("dü")
    sozluk2[:bir] = 1

    assert_equal __, sozluk2[:bir]
    assert_equal __, sozluk2[:iki]
  end

  def test_default_value_is_the_same_object
    sozluk = Hash.new([])

    sozluk[:bir] << "yek"
    sozluk[:iki] << "dü"

    assert_equal __, sozluk[:bir]
    assert_equal __, sozluk[:iki]
    assert_equal __, sozluk[:uc]

    assert_equal __, sozluk[:bir].object_id == sozluk[:iki].object_id
  end

  def test_default_value_with_block
    sozluk = Hash.new {|sozluk, key| sozluk[key] = [] }

    sozluk[:bir] << "yek"
    sozluk[:iki] << "dü"

    assert_equal __, sozluk[:bir]
    assert_equal __, sozluk[:iki]
    assert_equal __, sozluk[:uc]
  end
end
