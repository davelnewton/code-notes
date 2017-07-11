def object_to_float(var)
  if var.is_a?(Integer)
   var.to_f
  elsif var.is_a?(Float)
    var
  else
    var ? 1.0 : 0.0
  end
end

a = [1, 2.0, true, false]
puts a.map(&method(:object_to_float))

def foo(obj)
  obj.respond_to?(:to_f) ? obj.to_f : obj ? 1.0 : 0.0
end

puts "-" * 80

a = [1, 2.0, true, false]
puts a.map(&method(:foo))

puts "-" * 80
a = [1, 2.0, true, false]
tmp = a.map do |obj|
  obj.respond_to?(:to_f) ? obj.to_f : obj ? 1.0 : 0.0
end
puts tmp
