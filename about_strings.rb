require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutStrings < EdgeCase::Koan
  def test_double_quoted_strings_are_strings
    dizgi = "Merhaba, Dünya"
    assert_equal __, dizgi.is_a?(String)
  end

  def test_single_quoted_strings_are_also_strings
    dizgi = 'Hoşçakal, Dünya'
    assert_equal __, dizgi.is_a?(String)
  end

  def test_use_single_quotes_to_create_string_with_double_quotes
    dizgi = 'Dedi ki, "Uzaklaş."'
    assert_equal __, dizgi
  end

  def test_use_double_quotes_to_create_strings_with_single_quotes
    dizgi = "N'aber"
    assert_equal __, dizgi
  end

  def test_use_backslash_for_those_hard_cases
    a = "Dedi ki, \"N'aber\""
    b = 'Dedi ki, "N\'aber"'
    assert_equal __, a == b
  end

  def test_use_flexible_quoting_to_handle_really_hard_cases
    a = %(tırnaklar esnek olarak kullanılabildiğinden ' ve " karakterleri ile gösterilebilir)
    b = %!tırnaklar esnek olarak kullanılabildiğinden ' ve " karakterleri ile gösterilebilir!
    c = %{tırnaklar esnek olarak kullanılabildiğinden ' ve " karakterleri ile gösterilebilir}
    assert_equal __, a == b
    assert_equal __, a == c
  end

  def test_flexible_quotes_can_handle_multiple_lines
    uzun_dizgi = %{
En iyi zamanlarımızdı,
En kötü zamanlarımızdı.
}
    assert_equal __, uzun_dizgi.length
    assert_equal __, uzun_dizgi.lines.count
  end

  def test_here_documents_can_also_handle_multiple_lines
    uzun_dizgi = <<EOS
En iyi zamanlarımızdı,
En kötü zamanlarımızdı.
EOS
    assert_equal __, uzun_dizgi.length
    assert_equal __, uzun_dizgi.lines.count
  end

  def test_plus_will_concatenate_two_strings
    dizgi = "Merhaba, " + "Dünya"
    assert_equal __, dizgi
  end

  def test_plus_concatenation_will_leave_the_original_strings_unmodified
    hey = "Merhaba, "
    oradaki = "Dünya"
    dizgi = hey + oradaki
    assert_equal __, hey
    assert_equal __, oradaki
  end

  def test_plus_equals_will_concatenate_to_the_end_of_a_string
    hey = "Merhaba, "
    oradaki = "Dünya"
    hey += oradaki
    assert_equal __, hey
  end

  def test_plus_equals_also_will_leave_the_original_string_unmodified
    orjinal_dizgi = "Merhaba, "
    hey = orjinal_dizgi
    oradaki = "Dünya"
    hey += oradaki
    assert_equal __, orjinal_dizgi
  end

  def test_the_shovel_operator_will_also_append_content_to_a_string
    hey = "Merhaba, "
    oradaki = "Dünya"
    hey << oradaki
    assert_equal __, hey
    assert_equal __, oradaki
  end

  def test_the_shovel_operator_modifies_the_original_string
    orjinal_dizgi = "Merhaba, "
    hey = orjinal_dizgi
    oradaki = "Dünya"
    hey << oradaki
    assert_equal __, orjinal_dizgi

    # DÜŞÜN:
    #
    # Ruby programcıları dizgilerde çalışırken (+=) operatörü 
    # yerine (<<) operatörü kullanma eğilimindedirler.  Neden?
  end

  def test_double_quoted_string_interpret_escape_characters
    dizgi = "\n"
    assert_equal __, dizgi.size
  end

  def test_single_quoted_string_do_not_interpret_escape_characters
    dizgi = '\n'
    assert_equal __, dizgi.size
  end

  def test_single_quotes_sometimes_interpret_escape_characters
    dizgi = '\\\''
    assert_equal __, dizgi.size
    assert_equal __, dizgi
  end

  def test_double_quoted_strings_interpolate_variables
    deger = 123
    dizgi = "Değer: #{deger}"
    assert_equal __, dizgi
  end

  def test_single_quoted_strings_do_not_interpolate
    deger = 123
    dizgi = 'Değer: #{deger}'
    assert_equal __, dizgi
  end

  def test_any_ruby_expression_may_be_interpolated
    dizgi = "5'in karekökü, #{Math.sqrt(5)}"
    assert_equal __, dizgi
  end

  def test_you_can_get_a_substring_from_a_string
    dizgig = "Pastırma, marul ve domates"
    assert_equal __, dizgi[7,3]
    assert_equal __, dizgi[7..9]
  end

  def test_you_can_get_a_single_character_from_a_string
    dizgi = "Pastırma, marul ve domates"
    assert_equal __, dizgi[1]

    # Şaşırdık mı?
  end

  in_ruby_version("1.8") do
    def test_in_ruby_1_8_single_characters_are_represented_by_integers
      assert_equal __, ?a
      assert_equal __, ?a == 97

      assert_equal __, ?b == (?a + 1)
    end
  end

  in_ruby_version("1.9") do
    def test_in_ruby_1_9_single_characters_are_represented_by_strings
      assert_equal __, ?a
      assert_equal __, ?a == 97
    end
  end

  def test_strings_can_be_split
    dizgi = "Sosis Yumurta Peynir"
    kelimeler = dizgi.split
    assert_equal [__, __, __], kelimeler
  end

  def test_strings_can_be_split_with_different_patterns
    dizgi = "Yağmurdan:sonraki:toprak:kokusu"
    kelimeler = dizgi.split(/:/)
    assert_equal [__, __, __, __], kelimeler

    # NOT: Örnekler "Düzenli İfadeler'den" verilmiştir.  Ruby 
    # son derece güçlü bir "Düzenli İfade Kütüphanesine" sahiptir. 
    # Daha sonra bu konuya değineceğiz.
  end

  def test_strings_can_be_joined
    kelimeler = ["İşte", "şimdi", "tam", "zamanı"]
    assert_equal __, kelimeler.join(" ")
  end

  def test_strings_are_unique_objects
    a = "a dizgisi"
    b = "a dizgisi"

    assert_equal __, a           == b
    assert_equal __, a.object_id == b.object_id
  end
end
