  MAX = 99999999 # 最大值
  PRIME_NUMBER = 549755813887 # 質數
  PRIME_NUMBER_INVERSE = 20654203 # inverse(PRIME_NUMBER, MAX)

  def int2serial(source)
    return source.to_i * PRIME_NUMBER % MAX
  end
  def serial2int(source)
    return source.to_i * PRIME_NUMBER_INVERSE % MAX
  end

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
