class UnknownPlanet < StandardError
  def initialize(message = 'we are not aware of this planet')
    super
  end
end

class SpaceAge
  seconds_on_earth = 31_557_600

  ORBITAL_PERIODS = {
    mercury: Rational(0.2408467, 1),
    venus: Rational(0.61519726, 1),
    earth: 1r,
    mars: Rational(1.8808158, 1),
    jupiter: Rational(11.862615, 1),
    saturn: Rational(29.447498, 1),
    uranus: Rational(84.016846, 1),
    neptune: Rational(164.79132, 1)
  }.transform_values { _1 * seconds_on_earth }

  def initialize(seconds)
    @seconds = seconds
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s.start_with?('on_')
      planet = method_name.to_s.delete_prefix('on_').to_sym
      raise UnknownPlanet unless ORBITAL_PERIODS.key?(planet)

      self.class.define_method(method_name) do
        @seconds / ORBITAL_PERIODS[planet]
      end
      send(method_name)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('on_') || super
  end
end
