# integer-obfuscator 簡易型數字攪亂

### 可稍微打亂原始值，但不適合放機敏資料


需要給三個值

  * MAX = 99999999 # 給一個所需的總數
  * PRIME_NUMBER = 549755813887 # 給一個質數

```
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
  
  > inverse(PRIME_NUMBER, MAX)
  => 20654203
```
  
  * PRIME_NUMBER_INVERSE = 20654203

```
  def int2serial(source)
    return source.to_i * PRIME_NUMBER % MAX
  end
  def serial2int(source)
    return source.to_i * PRIME_NUMBER_INVERSE % MAX
  end
```

```
>  (1..20).each do |a|
>    puts "#{a} : #{int2serial(a)} : #{serial2int(int2serial(a))}"
>  end

1 : 55819384 : 1
2 : 11638769 : 2
3 : 67458153 : 3
4 : 23277538 : 4
5 : 79096922 : 5
6 : 34916307 : 6
7 : 90735691 : 7
8 : 46555076 : 8
9 : 2374461 : 9
10 : 58193845 : 10
11 : 14013230 : 11
12 : 69832614 : 12
13 : 25651999 : 13
14 : 81471383 : 14
15 : 37290768 : 15
16 : 93110152 : 16
17 : 48929537 : 17
18 : 4748922 : 18
19 : 60568306 : 19
20 : 16387691 : 20

# 基本上不特別處理是無法得知 55819384 原始值是 1
```