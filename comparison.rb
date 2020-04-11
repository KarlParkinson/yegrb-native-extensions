require "super"
require "benchmark"

def arr_mult(array1, array2, array3)
  result = []
  array1.each do |i1|
    array2.each do |i2|
      array3.each do |i3|
        result << i1*i2*i3
      end
    end
  end
end

n = 100

arr1 = (1..100).to_a
arr2 = (1..100).to_a
arr3 = (1..100).to_a

Benchmark.bm do |benchmark|
  benchmark.report("pure ruby") do
    n.times do
      arr_mult(arr1, arr2, arr3)
    end
  end

  benchmark.report("c extension") do
    n.times do
      Super::Super.new.arr_mult(arr1, arr2, arr3)
    end
  end
end
  
