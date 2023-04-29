require 'glimmer-dsl-libui'
require_relative 'app'

class MainWindow
  include Glimmer

  def initialize
    @view_tab_students = TabStudents.new
  end

  def create
    window('Универ', 600, 200) {
      tab {
        tab_item('Студенты') {
          @view_tab_students
        }
        tab_item('Вкладка 2') { }
        tab_item('Вкладка 3') { }
      }
    }
  end
end