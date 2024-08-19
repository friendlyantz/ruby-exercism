class SpaceAge
  ORBITAL_PERIODS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132,
  }

  SECONDS_ON_EARTH = 31557600

  def initialize(seconds)
    @seconds = Integer(seconds)
  end

  # def on_earth
  #   (@seconds / (ORBITAL_PERIODS[:earth] * SECONDS_ON_EARTH )).round(2)
  # end

  ORBITAL_PERIODS.each do |name, period|
    define_method :"on_#{name}" do
      (@seconds / (ORBITAL_PERIODS[name] * SECONDS_ON_EARTH )).round(2)
    end
  end
end
