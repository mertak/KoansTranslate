require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# Buraya bir DiceSet sınıfı koyalım:
#
# class DiceSet
#   kod ...
# end

class AboutDiceProject < EdgeCase::Koan
  def test_can_create_a_dice_set
    zar = DiceSet.new
    assert_not_nil zar
  end

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    zar = DiceSet.new

    zar.roll(5)
    assert zar.values.is_a?(Array), "Bir dizi olmalı"
    assert_equal 5, zar.values.size
    zar.values.each do |deger|
      assert deger >= 1 && deger <= 6, "#{value} değeri 1 ve 6 arasında olmak zorunda "
    end
  end

  def test_dice_values_do_not_change_unless_explicitly_rolled
    zar = DiceSet.new
    zar.roll(5)
    ilk_kez = zar.values
    ikinci_kez = zar.values
    assert_equal ilk_kez, ikinci_kez
  end

  def test_dice_values_should_change_between_rolls
    zar = DiceSet.new

    zar.roll(5)
    ilk_kez = zar.values

    zar.roll(5)
    ikinci_kez = zar.values

    assert_not_equal ilk_kez, ikinci_kez,
      "2 atış aynı olmamalı"

    # DÜŞÜN:
    #
    # Eğer atışlar rastgeleyse, o zaman ardışık iki zarın (kesin olmayacak
    # şekilde) aynı gelmesi ihtimali vardır.  Bunu test etmenin daha güzel
    # bir yolu olmalı.
  end

  def test_you_can_roll_different_numbers_of_dice
    zar = DiceSet.new

    zar.roll(3)
    assert_equal 3, zar.values.size

    zar.roll(1)
    assert_equal 1, zar.values.size
  end

end
