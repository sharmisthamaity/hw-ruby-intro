# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # returns sum of arr
  current_sum = 0
  arr.each do |i|
    current_sum = current_sum + i
  end
  
  return current_sum
  
end

def max_2_sum arr
  # returns sum of two largest elements in arr
  max1 = max(arr)
  i = max_i(arr)
  arr.delete_at(i)
  max2 = max(arr)
  
  return max1+max2
  
end

def sum_to_n? arr, n
  # returns true if any two elements sum to n
  arr.each_with_index do |i,index|
    a = i
    arr.each_with_index do |j, index2|
      if(index2 != index)
        b = j
        if(sum2_to_n?(a,b,n) == true)
          return true
        end
      end
    end
  end
  return false
end

# HELPER FUNCTIONS
def sum2_to_n? a,b,n
  #returns true if sum of a and b is n
  if(a+b == n)
    return true
  end
  return false
end

def max arr
  # returns largest element in arr
  max = 0
  if(arr.length > 0)
    max = arr[0]
  end

  arr.each do |i|
    if i>max
      max = i
    end
  end
  return max
end

def max_i arr
  #returns index of largest element in arr
  max = 0
  if(arr.length > 0)
    max = arr[0]
  end
  index = 0
  count = 0
  arr.each do |i|
    if i>max
      max = i
      index = count
    end
    count = count+1
  end
  return index
end

# Part 2

def hello(name)
  # returns "Hello, *name*"
  return "Hello, "+name
end

def starts_with_consonant? s
  # returns true if string starts with consonant
  if(s.length == 0)
    return false
  end
  firstLet = s[0]
  if (!(firstLet.match(/[[:alpha:]]/)))
    return false
  end
  firstLetLower = firstLet.downcase
  vowels = "aeiou"
 return !(vowels.include? firstLetLower)
end

def binary_multiple_of_4? s
  # returns true if string represents binary number that is a multiple of 4
  if((/[[:alpha:]]/.match(s)))
    return false
  end
  if(s.length < 1)
    return false
  end
  #get the decimal value from binary string
  binaryNum = binToDec(s)
  #if decimal value is multiple of 4, return true
  if (binaryNum % 4 == 0)
    return true
  end
  return false
end

# HELPER FUNCTIONS

def binToDec s
  #returns decimal value from binary string
  value = 0
  sRev = s.reverse
  sarr = sRev.split('')
  sarr.each_with_index do |digit, index|
    digitValue = (digit.to_i)*(2**index)
    value = value + digitValue
  end
  return value
end

# Part 3

class BookInStock
  def initialize(i, p)
    if(i.length < 1)
      raise ArgumentError.new("invalid isbn")
    end
    if(p <= 0)
      raise ArgumentError.new("invalid price")
    end
    @isbn = i
    @price = p
  end
  
  def isbn
    @isbn
  end
  
  def isbn=(i)
    @isbn = i
  end
  
  def price
    @price
  end
  
  def price=(p)
    @price = p
  end
  
  def price_as_string
    if(@price % 1 != 0)
      #price has decimal
      
      value = @price.round(2)
      cents = ((value % 1).round(2))
      dollars = (value - cents).to_i
      
    else
      #price doesn't have decimal
      
      value = @price
      cents = 0
      dollars = value
      
    end
    
    if(cents == 0)
      #price will have .00 (0 cents)
      priceStr = "$" + dollars.to_s + ".00"
    else
      #price will have cents
      priceStr = "$" + dollars.to_s + ((cents.to_s)+"0")[1,3]
    end
    
    return priceStr
  end
end
