class SliceLengthError < ArgumentError
end

class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(number)
    number = Integer(number)
    raise SliceLengthError, 'Slice size can not exceed sample length' if number > string.length

    @string
      .chars
      .each_cons(number)
      .map(&:join)
  end
end

binding.irb if $PROGRAM_NAME == __FILE__ && $DEBUG
