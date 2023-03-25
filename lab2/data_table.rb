class DataTable

  def initialize(data)
    @data = data
  end

  def get_element(row,col)
    @data[row][col]
  end

  def count_row
    @data.size
  end

  def count_col
    @data[0].size
  end

end

# тестовые данные
db = DataTable.new([[1,2,3,4,5],
                    [9,1,2,3,2],
                    [3,4,6,7,9]])

puts db.get_element(2,3) # 4езначение из 3й строки (7)
puts db.count_col # кол-во столбцов (5)
puts db.count_row # кол-во строк (3)

