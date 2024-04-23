class Series
  def initialize(string)
    @string = string
  end

  def slices(num)
    raise ArgumentError if num > @string.length

    @string
      .chars
      .each_cons(num)
      .map(&:join)
  end
end
