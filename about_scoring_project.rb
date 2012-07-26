require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# Greed 5 adet zar ile oynanan ve puan toplama amacı olan bir oyundur.
# "score" fonksiyonu tek bir zardan gelecek puanı toplayacaktır.
#
# Puanlama sistemi aşağıdaki gibidir:
#
# * 3 adet 1'den oluşan bir set 1000 puan değerindedir
#
# * Herhangi bir rakamdan(1 hariç) oluşan 3'lü bir set
#   numaranın 100 katı puan eder(ör. 3 tane 5 = 500).
#
# * Bir tane 1 (3'lü sete dahil olmamak üzere) 100 puan eder.
#
# * Bir tane 5 (3'lü sete dahil olmamak üzere) 50 puan eder.
#
# * Diğer her şey 0 puan eder.
#
#
# Örnekler:
#
# score([1,1,1,5,1]) => 1150 puan
# score([2,3,4,6,2]) => 0 puan
# score([3,4,5,3,3]) => 350 puan
# score([1,5,1,2,4]) => 250 puan
#
# Daha fazla örnek aşağıdaki kodlarda var:
#
# Senin görevin bu "score" metodunu yazmak.

def score(dice)
  # Hadi yaz bakalım
end

class AboutScoringProject < EdgeCase::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
  end

end
