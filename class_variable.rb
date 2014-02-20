class Holder
  @@var = 99
  def Holder.var=(val)
    @@var = val
  end
  def var
    @@var
  end
end

@@var = "top level variable"
a = Holder.new
puts a.var #"top level class variable, class Object's class variable"
Holder.var = 123
puts a.var #123

class A
  @@var = 10
  def self.var=(var)
    @@var = var
  end
end

class B < A
  @@var = 8
  def var
    @@var
  end
end

b= B.new
A.var = 7
puts b.var #7
