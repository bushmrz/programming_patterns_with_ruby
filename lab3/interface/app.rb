require 'glimmer-dsl-libui'

class TabStudents
  include Glimmer

  def initialize
    @controller = TabStudentsController.new(self)
  end

  def sort_column(col_index)
    rows = @table.cell_rows

    # Сортировка строк в выбранном столбце
    sorted_rows = rows.sort_by { |row|
      if row[col_index]!=nil
        row[col_index]
      else
        row[col_index]=''
        row[col_index]
      end}

    # Отображение сортировки в интерфейсе
    @table.cell_rows = sorted_rows
  end
  def on_create

  end

  def create
    root_container = horizontal_box {
      # Секция 1
      vertical_box {
        stretchy false

        form {
          stretchy false

          @filter_last_name_initials = entry {
            label 'Фамилия И. О.'
          }

          @filters = {}
          fields = [[:git, 'Github'], [:mail, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]

          fields.each do |field|
            @filters[field[0]] = {}

            @filters[field[0]][:combobox] = combobox {
              label "Наличие #{field[1]}"
              items ['Не важно', 'Есть', 'Нет']
              selected 0

              on_selected do
                if @filters[field[0]][:combobox].selected == 1
                  @filters[field[0]][:entry].read_only = false
                else
                  @filters[field[0]][:entry].text = ''
                  @filters[field[0]][:entry].read_only = true
                end
              end
            }

            @filters[field[0]][:entry] = entry {
              label field[1]
              read_only true
            }
          end
        }
      }

      # Секция 2
      vertical_box {
        @table = table {
          #
          # text_column('ФИО')
          # text_column('Github')
          # text_column('Контакт')

          column_headers = ['ФИО', 'Github', 'Контакт']
          column_headers.each_with_index do |header, index|
            text_column(header) {
              on_clicked do
                # сортировка по выбранному столбцу
                sort_column(index)
              end
            }
          end

          editable false


          data = [['Шнайдер И.А.', 'buuushmrz', '+79006660111'], ['Хахук Р.Н.', 'delta_null', '+79183939494'],
                     ['Худокормов Д.А.', 'KittenQZ', nil], ['Базовый Ю.Т.', nil, 'example@ex.ex']]
          cell_rows data

          # data.each_with_index do |header, index|
          #   puts header,index
          # end
        }

        @pages = horizontal_box {
          stretchy false


          Array(1..7).each do |index|
            button((index).to_s)
          end
        }
      }

        @actions = vertical_box {

          stretchy false

          button_edit = button('Редактировать') {
            on_clicked do
              edit_row
            end
          }
          button_update = button('Обновить') {
            on_clicked do
              update_row
            end
          }
          button_create = button('Создать') {
            on_clicked do
              create_row
            end
          }
          button_delete = button('Удалить') {
            on_clicked do
              delete_row
            end
          }


          # button_update.enable
          # button_create.enable
          # button_edit.enable
          # button_delete.disable


        }
    }

    on_create
    root_container

  end
end