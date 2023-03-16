class Student

  # конструктор
  def initialize(last_name, first_name, second_name, options = {})
    self.last_name = last_name
    self.first_name = first_name
    self.second_name = second_name
    self.id = [options:id]
    self.phone = [options:phone]
    self.mail = [options:mail]
    self.telegram = [options:telegram]
    self.git = [options:git]
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

end