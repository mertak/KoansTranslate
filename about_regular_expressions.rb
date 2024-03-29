# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutRegularExpressions < EdgeCase::Koan
  def test_a_pattern_is_a_regular_expression
    assert_equal __, /pattern/.class
  end

  def test_a_regexp_can_search_a_string_for_matching_content
    assert_equal __, "Bagdat gibi diyar"[/gibi/]
  end

  def test_a_failed_match_returns_nil
    assert_equal __, "Bagdat gibi diyar"[/olmayan/]
  end

  # ------------------------------------------------------------------

  def test_question_mark_means_optional
    assert_equal __, "abbcccddddeeeee"[/ab?/]
    assert_equal __, "abbcccddddeeeee"[/az?/]
  end

  def test_plus_means_one_or_more
    assert_equal __, "abbcccddddeeeee"[/bc+/]
  end

  def test_asterisk_means_zero_or_more
    assert_equal __, "abbcccddddeeeee"[/ab*/]
    assert_equal __, "abbcccddddeeeee"[/az*/]
    assert_equal __, "abbcccddddeeeee"[/z*/]

    # DÜŞÜN:
    #
    # * Eşleştirmeyi yapamadığında ne olur?
  end

  # DÜŞÜN:
  #
  # Tekrarlı işleçler "açgözlü" demiştik.
  #
  # Niçin?

  # ------------------------------------------------------------------

  def test_the_left_most_match_wins
    assert_equal __, "abbccc az"[/az*/]
  end

  # ------------------------------------------------------------------

  def test_character_classes_give_options_for_a_character
    hayvanlar = ["cat", "bat", "rat", "zat"]
    assert_equal __, hayvanlar.select { |a| a[/[cbr]at/] }
  end

  def test_slash_d_is_a_shortcut_for_a_digit_character_class
    assert_equal __, "aradigimiz numara 42"[/[0123456789]+/]
    assert_equal __, "aradigimiz numara 42"[/\d+/]
  end

  def test_character_classes_can_include_ranges
    assert_equal __, "aradigimiz numara 42"[/[0-9]+/]
  end

  def test_slash_s_is_a_shortcut_for_a_whitespace_character_class
    assert_equal __, "bosluk: \t\n"[/\s+/]
  end

  def test_slash_w_is_a_shortcut_for_a_word_character_class
    # NOT:  Bir programcı kelimeyi böyle tanımlar.
    assert_equal __, "degisken_1 = 42"[/[a-zA-Z0-9_]+/]
    assert_equal __, "degisken_1 = 42"[/\w+/]
  end

  def test_period_is_a_shortcut_for_any_non_newline_character
    assert_equal __, "abc\n123"[/a.+/]
  end

  def test_a_character_class_can_be_negated
    assert_equal __, "aradigimiz numara 42"[/[^0-9]+/]
  end

  def test_shortcut_character_classes_are_negated_with_capitals
    assert_equal __, "aradigimiz numara 42"[/\D+/]
    assert_equal __, "bosluk: \t\n"[/\S+/]
    # ... bir programcı daha çok şunu tercih eder
    assert_equal __, "degisken_1 = 42"[/[^a-zA-Z0-9_]+/]
    assert_equal __, "degisken_1 = 42"[/\W+/]
  end

  # ------------------------------------------------------------------

  def test_slash_a_anchors_to_the_start_of_the_string
    assert_equal __, "basla bitir"[/\Abasla/]
    assert_equal __, "basla bitir"[/\Abitir/]
  end

  def test_slash_z_anchors_to_the_end_of_the_string
    assert_equal __, "basla bitir"[/bitir\z/]
    assert_equal __, "basla bitir"[/basla\z/]
  end

  def test_caret_anchors_to_the_start_of_lines
    assert_equal __, "no 42\n2 satir"[/^\d+/]
  end

  def test_dollar_sign_anchors_to_the_end_of_lines
    assert_equal __, "2 satir\nno 42"[/\d+$/]
  end

  def test_slash_b_anchors_to_a_word_boundary
    assert_equal __, "badana danalar"[/\bdana./]
  end

  # ------------------------------------------------------------------

  def test_parentheses_group_contents
    assert_equal __, "ahahaha"[/(ha)+/]
  end

  # ------------------------------------------------------------------

  def test_parentheses_also_capture_matched_content_by_number
    assert_equal __, "Can, Guven"[/(\w+), (\w+)/, 1]
    assert_equal __, "Can, Guven"[/(\w+), (\w+)/, 2]
  end

  def test_variables_can_also_be_used_to_access_captures
    assert_equal __, "Isim:  Can, Guven"[/(\w+), (\w+)/]
    assert_equal __, $1
    assert_equal __, $2
  end

  # ------------------------------------------------------------------

  def test_a_vertical_pipe_means_or
    guven_ailesi = /(Can|Hamit|Leyla) Guven/
    assert_equal __, "Can Gray"[guven_ailesi]
    assert_equal __, "Leyla Gray"[guven_ailesi, 1]
    assert_equal __, "Halil Gray"[guven_ailesi, 1]
  end

  # DÜŞÜN:
  #
  # Karakter sınıflarında kullanılan ([...]) ve (|) arasındaki farkları açıklayın.

  # ------------------------------------------------------------------

  def test_scan_is_like_find_all
    assert_equal __, "bir iki-uc".scan(/\w+/)
  end

  def test_sub_is_like_find_and_replace
    assert_equal __, "bir iki-uc".sub(/(t\w*)/) { $1[0, 1] }
  end

  def test_gsub_is_like_find_and_replace_all
    assert_equal __, "bir iki-uc".gsub(/(t\w*)/) { $1[0, 1] }
  end
end
