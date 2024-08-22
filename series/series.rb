class SliceLengthError < ArgumentError
  def initialize(message = 'Slice size can not exceed sample length')
    super
  end
end

class Series
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def slices(number)
    number.positive? or raise SliceLengthError, 'must be positive'
    number <= string.length or raise SliceLengthError

    @string
      .chars
      .each_cons(number)
      .map(&:join)
  end
end

