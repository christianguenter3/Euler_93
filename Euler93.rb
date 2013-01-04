class Euler93
  def arith_exp
    digits, operators, brackets, res  = _get_digits("1234"), _get_operators, _get_brackets, []
    digits.each do |n|
      operators.each do |op|
        #expr = _merge_num_and_op(n, op)
        #val = eval(expr)
        #puts "Expr: #{expr} => #{val}" if val % 1 == 0
        #res << val if val % 1 == 0 && val > 0
      end
    end
    return res.sort.uniq
  end

  def _merge_num_and_op(n,op,br)
    nums, operators, brackets, res = n.split(//), op.split(//),brackets.split(//), []
    num_count, x_count = 0,0
    brackets.each_with_index do |x,index|
      if x == "(" || x == ")"
        res << x
      else
        if x_count % 2 == 0
          res << nums[num_count]
          num_count += 1
        else
          res << operators[num_count]
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
    res << "XXXXX(XX)"
    res << "XX(XX(XXX))"
    res << "XX(XXXXX)"
    return res
  end

end
