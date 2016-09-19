
  MAX = 99
  COPRIME = 7
  COPRIME_INVERSE = 85


  def inverse(a, n)
    t = 0 ; newt = 1
    r = n ; newr = a
    while newr != 0
      quotient = r / newr
      t , newt = newt , t - quotient * newt
      r , newr = newr , r - quotient * newr
    end
    return "a is not invertible" if r > 1
    return t < 0 ? t + n : t
  end


  def i2s(source)
    return source.to_i * COPRIME % MAX
  end
  def s2i(source)
    return source.to_i * COPRIME_INVERSE % MAX
  end
