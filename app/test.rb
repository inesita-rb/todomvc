class DSL
  def initialize(bloczek)
    @bloczek = bloczek
    instance_eval(&@bloczek)
  end

  def dsl_method
    puts 'dsl_method'
  end
end

class Test
  def test
    dsl_method
  end
end

prc1 = proc { puts self; dsl_method }
prc2 = Test.new.method(:test)

puts prc2.to_proc.call

puts prc1
puts prc2

DSL.new(prc2)

