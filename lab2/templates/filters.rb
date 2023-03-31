require_relative './base_filter.rb'
class MainFilter
  attr_accessor :f_name

  def initialize(f_name:)
    self.f_name = f_name
  end
  def action(object)
    filtering(select_names(object))
  end
  private def select_names(object)
    object.instance_variables{ |x| x.to_s[1..-1]}
  end

  def filtering(names)
    f_name.filter(names)
  end
end
