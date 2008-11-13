# (The MIT License)
#
# Copyright © 2008 Intelitiva (intelitiva.com)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
class Iterator
  attr_accessor :array
  attr_accessor :index

  # Initialize instances of Iterators.
  def initialize(array)
    self.array = array
    self.index = -1
  end

  # Get the next element in relation to current.
  def next_element
    validates_possibility_of :next
    self.index += 1
    self.current
  end

  # Get the previous element in relation to current.
  def previous
    validates_possibility_of :previous
    self.index -= 1
    self.current
  end

  # Get the current element of array.
  def current
    validates_possibility_of :current
    self.array[index]
  end

  # Check if the array has more elements in relation to current.
  def has_next?
    !self.last?
  end

  # Check if the current element is the first element of array.
  def last?
    self.index == (self.array.length - 1)
  end

  # Check if the current element is the first element of array.
  def first?
    self.index == 0
  end

  # Delegates methods missing to array.
  def method_missing(method, *args, &block)
    self.array.send(method, *args, &block)
  end

  protected
    # Validate the possibility of to do the given action.
    def validates_possibility_of(action)
      case action
      when :next
        raise "There aren't more elements into the array. The current element is the last element of the array." if self.last?
      when :previous
        raise "There aren't previous elements into the array. The current element is the first element of the array." if self.first?
      when :current
        raise "There is no current element. You need iterate over it to have a current element. Use next_element." if self.index == -1
      end
      true
    end
end

# Add iterator method to arrays.
Array.class_eval do
  def iterator
    Iterator.new(self)
  end
end
