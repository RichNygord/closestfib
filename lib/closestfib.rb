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
        next_fib while ! @@fibs[n]
        @@fibs[n]
      end

      def next_fib
        @@fibs[@@fibs.length] = last_fib + prev_fib
      end
      
      def last_fib
        @@fibs[@@fibs.length-1]
      end

      def prev_fib
        @@fibs[@@fibs.length-2]
      end

      def all
        @@fibs
      end
      
      def flush
        @@fibs = [0,1]
      end
    end    
  end
  
  def self.closestfib x
    raise(Error, "no Fibonacci numbers are less than 0") if x <= 0
    n=0
    n+=1 while (Fibs.fib n) < x
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

