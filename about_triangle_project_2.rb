require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# Triangle metodunu 'triangle.rb' içine yazman gerek.
require 'triangle.rb'

class AboutTriangleProject2 < EdgeCase::Koan
  # İlk atamada hatalarla nasıl başa çıkacağımızı ele almamıştık.
  # Şimdi bu kısmı ele alalım.
  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end
    assert_raise(TriangleError) do triangle(3, 4, -5) end
    assert_raise(TriangleError) do triangle(1, 1, 3) end
    assert_raise(TriangleError) do triangle(2, 4, 2) end
    # İPUCU: yardımı olabilir http://stackoverflow.com/questions/3834203/ruby-koan-151-raising-exceptions
 end
end

