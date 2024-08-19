class Series
  def initialize(string)
    @string = string
  end

  def slices(number)
    number = Integer(number)
    raise ArgumentError, "Slice size of #{number} exceeds word length #{@string.length}" if number > @string.length

    @string
      .chars
      .each_cons(number)
      .map(&:join)
  end
end

binding.irb
