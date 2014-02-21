OUTER_CONST = 99
class Const
  def get_const
    CONST
  end
  CONST = OUTER_CONST + 1
end

Const.new.get_const #=>100
Const::CONST #=>100
::OUTER_CONST #=>99
Const::NEW_CONST = 123
