class Page < ApplicationRecord
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, class_name: 'AdminUser'

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('pages.position ASC') }
  scope :newest_first, -> { order('pages.created_at DESC') }
  scope :search, lambda { |query|
    where(['name LIKE ?', "%#{query}%"])
  }
end
