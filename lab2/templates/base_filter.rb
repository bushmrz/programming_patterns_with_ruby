class BaseFilter
  def filter(names)
    raise 'Method dont realize yet'
  end
end

class BaseFilterWithout<BaseFilter
  def filter(names)
    names.filter {|v| v!="@id" }
  end
end
