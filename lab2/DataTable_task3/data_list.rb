class DataList
  attr_accessor :data_list, :selected_id
  def initialize(el)
    self.data_list =  el.sort_by(&:id)
    self.selected_id = []
  end

  def select(number)
    element = self.data_list[number-1]
    self.selected_id << element.id
  end

  def get_selected
    self.selected_id
  end

  def get_names
    raise "Method doesn't realize yet"
  end

  def get_data
    raise "Method doesn't realize yet"
  end
end
