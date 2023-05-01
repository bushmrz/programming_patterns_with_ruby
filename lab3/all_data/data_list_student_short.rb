require_relative 'data_list'

class DataListStudentShort < DataList

  public_class_method :new

  def column_names
    ['Фамилия И. О.', 'Гит', 'Контакт']
  end

  protected

  def table_fields(obj)
    [obj.last_name_and_initials, obj.git, obj.contact]
  end
end


