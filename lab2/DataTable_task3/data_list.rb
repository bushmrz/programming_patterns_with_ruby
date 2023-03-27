class DataList
  # attr_accessor :data_list, :selected_elem
  def initialize(data)
    @data_list = data.sort_by(&:id)
    @selected_id = []
  end

  def select(number)
    element = @data_list[number-1]
    @selected_id << element.id
  end

  def get_selected
    @selected_id
  end

  def get_names
    raise "Method doesn't realize yet"
  end

  def get_data
    raise "Method doesn't realize yet"
  end
end
