class Post < ApplicationRecord
  has_ancestry

  before_validation :set_url

  validates :name, format: { with: /\A[a-zа-я0-9_]+\z/i }
  validates :url, presence: true, uniqueness: true

  after_commit do
    # binding.pry
    if saved_change_to_name?
      children.each &:update_url # cildren.each {|c| c.update_url}
    end
  end

  def set_url
    self.url = generate_url
  end

  def generate_url
    # path.map(&:name).join('/')
    if parent.present?
      self.url = [parent.url, name ].join('/')
    else
      self.url = name if url.blank?
    end
  end

  def update_url
    update(url: generate_url)
  end

end
