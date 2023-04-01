class DataConstructor
  def construct(values)
    raise "Method dont realize yet"
  end
  def action(values)
    raise "Method dont realize yet"
  end
end
class DefaultDataConstructor<DataConstructor
  def construct(values, attrs)
    (0...values.size).map { |item_index|
      (0...attrs.size + 1).map { |name_index|
        if name_index == 0 then item_index
        else values[item_index].instance_variable_get("#{attrs[name_index - 1]}")
        end
      }
    }
  end

  def action(values, attrs)
    construct(values, attrs)
  end
end
