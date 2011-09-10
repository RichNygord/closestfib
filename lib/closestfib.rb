# Written by Richard Nygord, Copyright (c) 2011
# Created on 9/10/11
# Find the closest fibonacci number less than n
# Adds method closest_fibonacci to Fixnum and Bignum

module ClosestFib
  class Error < RuntimeError
  end
  
  class Fibs   
    @@fibs = [0,1]
    
    class << self
      def fib n
        if n > 1
          while @@fibs[n] == nil do
            next_fib
          end
        end
        @@fibs[n]
      end

      def last_fib
        @@fibs[@@fibs.length-1]
      end

      def prev_fib
        @@fibs[@@fibs.length-2]
      end

      def next_fib
        @@fibs[@@fibs.length] = prev_fib + last_fib
      end
    end    
  end
  
  def self.closestfib x
    raise(Error, "no fibonacci numbers are negative") if x <= 0
    n=0
    while (Fibs.fib n) < x do
      n += 1
    end
    Fibs.fib n-1
  end
end

class Fixnum
  def closest_fibonacci
    ClosestFib.closestfib self
  end
end

class Bignum
  def closest_fibonacci
    ClosestFib.closestfib self
  end
end

