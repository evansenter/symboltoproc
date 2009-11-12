def returning(value)
  yield value
  value
end

class Symbol
  def [](object)
    object.method(self)
  end
  
  def []=(object, function)
    symbol = self
    eigenclass = (class << object; self; end)
    eigenclass.instance_eval { define_method(symbol, function) }
  end
end

class Module
  alias [] instance_method
  
  def []=(symbol, function)
    self.instance_eval { define_method(symbol, function) }
  end
end