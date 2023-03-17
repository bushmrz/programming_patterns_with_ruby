class Student

  # конструктор
  def initialize(last_name, first_name, second_name, id=nil, phone=nil, mail=nil, telegram=nil, git=nil )
    set_lastname(last_name)
    set_firstname(first_name)
    set_secondname(second_name)
    set_id(id)
    set_phone(phone)
    set_mail(mail)
    set_telegram(telegram)
    set_git(git)
  end

  def get_lastname
    @last_name
  end

  def set_lastname(new_name)
    @last_name = new_name
  end

  def get_firstname
    @first_name
  end

  def set_firstname(new_name)
    @first_name = new_name
  end

  def get_secondname
    @second_name
  end

  def set_secondname(new_secondname)
    @second_name = new_secondname
  end

  def get_id
    @id
  end

  def set_id(new_id)
    @id = new_id
  end

  def set_phone(new_phone)
    @phone = new_phone
  end

  def get_phone
    @phone
  end

  def get_telegram
    @telegram
  end

  def set_telegram(new_telegram)
    @telegram = new_telegram
  end

  def set_mail(new_mail)
    @mail = new_mail
  end

  def get_mail
    @mail
  end

  def get_git
    @git
  end

  def set_git(new_git)
    @git = new_git
  end

  def to_s
    if @id != nil
      id_info = "ID: #{@id}"
    end

    fio_info = "ФИО: #{@last_name} #{@first_name} #{@second_name}"

    if have_any_contact
      contacts_info = "Контакты:"

      contacts_info += @phone == nil ? "" : "\n\tТелефон: #{@phone}"
      contacts_info += @telegram == nil ? "" : "\n\tТелеграм: #{@telegram}"
      contacts_info += @mail == nil ? "" : "\n\tПочта: #{@mail}"
      contacts_info += @git == nil ? "" :  "\n\tГит: #{@git}"
    end

    [id_info, fio_info, contacts_info].join("\n")
  end

  def have_any_contact
    @phone != nil || @telegram  != nil || @mail != nil || @git != nil
  end
end