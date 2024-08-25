class SliceLengthError < ArgumentError
  def initialize(message = 'Slice size can not exceed sample length')
    super
  end
end

class InvalidInput < ArgumentError
  def initialize(message = 'Invalid input: please provide a String or Array')
    super
  end
end

class Series

  private

  attr_writer :collection

  def initialize(*input)
    input = input.first if input.size == 1
    @collection =
      case input
      in String then input.chars
      in _ if _.respond_to?(:index) then input
      else raise InvalidInput
      end
  end

  public

  attr_reader :collection

  def slices(slice_size)
    slice_size.positive? or raise SliceLengthError, 'must be positive'
    slice_size <= collection.size or raise SliceLengthError

    collection
      .each_cons(slice_size)
      .map(&:join)
  end
end

