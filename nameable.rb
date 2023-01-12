class Nameable
  def correct_name
    raise NotImplementedError, 'Not Implmented'
  end
end

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.split.map(&:capitalize).join(' ')
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.slice(0, 9)
  end
end
