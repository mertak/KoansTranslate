# Triangle Projesi Kodu.

# Triangle bir üçgenin kenar uzunluklarını analiz eder.
# (ra,b, ve c diye bahsedilen) ve üçgenin tipini döndürür.
#
# Şunları döndürür:
#   :eskenar  tüm kenarlar eşit uzunluktaysa
#   :ikizkenar    yalnızca 2 kenar eşit ise
#   :cesit_kenar     eşit uzunlukta kenar yoksa
#
# Bu metod ile ilgili testler şurada bulunabilir:
#   about_triangle_project.rb
# ve
#   about_triangle_project_2.rb
# 
def triangle(a, b, c)
  # BU KODU YAZ
  #--
  a, b, c = [a, b, c].sort
  fail TriangleError if (a+b) <= c
  sides = [a, b, c].uniq
  [nil, :eskenar, :ikizkenar, :cesit_kenar][sides.size]
  #++
end

# Error sınıfı 2. bölümde kullanıldı. Bu bölümü değiştirmeye lüzum yok.
class TriangleError < StandardError
end
