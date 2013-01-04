require 'Set'
class Euler93
  def get_max
    max_val, max_s = 0, ""
    (0..9).to_a.combination(4).each do |x|
      val = arith_exp(x.join.to_s)
      max_val, max_s = val, x.join.to_s if val > max_val
    end
    return max_val, max_s
  end
  
  def arith_exp(input)
    digits, operators, brackets, res  = _get_digits(input), _get_operators, _get_brackets, []
    digits.each do |n|
      operators.each do |op|
        brackets.each do |br|
          expr = _merge_num_and_op(n, op, br)
          val = eval(expr)
          #puts "Expr: #{expr} => #{val}" if val % 1 == 0
          res << val if val % 1 == 0 && val > 0
        end
      end
    end
    return get_cons_length(res.sort.uniq)
  end

  def get_cons_length(input)
    set_i = input.to_set
    
    set_i.each do |x| 
      if set_i.include?(x.to_i.next.to_f)
      else
        return x
      end
    end
  end

  def _merge_num_and_op(n,op,br)
    nums, operators, brackets, res = n.split(//).reverse, op.split(//).reverse,br.split(//), []
    num_count, x_count = 0,0
    brackets.each_with_index do |x,index|
      if x == "(" || x == ")"
        res << x
      else
        if x_count % 2 == 0
          res << nums.pop.to_f
        else
          res << operators.pop
        end
        x_count += 1
      end
    end
    res.join.to_s
  end

  private

  def _get_digits(input)
    input.split(//).map{|x| x}.permutation.map{|x| x.join.to_s}
  end

  def _get_operators
    ("-+*/"*3).split(//).combination(3).to_a.uniq.map{|x| x.join.to_s}
  end

  def _get_brackets
    res = []
    res << "XXXXXXX"
    res << "(XXX)XXXX"
    res << "((XXX)XX)XX"
    res << "(XXXXX)XX"
    res << "XX(XXX)XX"
    res << "(XX(XXX))XX"
    res << "XX((XXX)XX)"
    res << "XXXX(XXX)"
    res << "XX(XX(XXX))"
    res << "XX(XXXXX)"
    return res
  end

end
