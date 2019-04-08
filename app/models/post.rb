class Post < ApplicationRecord
  has_ancestry

  before_validation :set_url
  before_save :downcase_field

  validates :name, format: { with: /\A[a-zа-я0-9_]+\z/i }
  validates :url, presence: true, uniqueness: true

  #После того как изменилось имя меняет URL у всех детей
  after_commit do
    if saved_change_to_name?
      subtree.each &:update_url # cildren.each {|c| c.update_url}
    end
  end

  #Присваиваю новому объекту URL
  def set_url
    self.url = generate_url
  end

  #Генерирую URL из url родителя и нового имени
  def generate_url
    if parent.present?
      self.url = [parent.url, name ].join('/')
    else
      self.url = name if url.blank?    #Если родителя нет то URLy присваивается Имя
    end
  end

  #Обновляю URL при изменении имени
  def update_url
    update(url: generate_url)
  end

  #Для того что бы URL был с маленькой буквы
  def downcase_field
    self.url.downcase!
  end

end
