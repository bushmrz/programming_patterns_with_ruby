require_relative './data_list.rb'
require_relative './data_table.rb'
class DataListStudentShort < DataList
  attr_accessor :data_list
  def initialize(data)
    super(data)
  end
  def get_names
    self.data_list.first.instance_variables{ |x| x.to_s[1..-1]}
  end
  def get_data
    data = [[*(1..self.data_list.length)]]
    data += self.data_list.map{|elem| instance_variables_without_id(elem)}
    DataTable.new(data)
  end

  private
  # вспомогательный метод для исключения атрибута id из массива
  def instance_variables_without_id(object)
    object.instance_variables.reject{|v| v.to_sym ==:@id}.map{|v| object.instance_variable_get(v)}
  end
end
