class BaseFilter
  def filter(names)
    raise 'Method dont realize yet'
  end

  def action(object)
    raise 'Method dont realize yet'
  end
end

class MainFilter<BaseFilter
  def filter(names)
    names.filter {|v| v!="@id" }
  end

  def action(object)
    filter(select_names(object))
  end
  private def select_names(object)
    object.instance_variables{ |x| x.to_s[1..-1]}
  end
end
