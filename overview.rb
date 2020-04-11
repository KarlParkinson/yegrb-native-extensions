module Super
  class Super
    def initialize
    end

    def add(num1, num2)
      num1 + num2
    end

    def arr_mult(array1, array2, array3)
      result = []
      array1.each do |i1|
        array2.each do |i2|
          array3.each do |i3|
            result << i1*i2*i3
          end
        end
      end
      result
    end
  end
end
