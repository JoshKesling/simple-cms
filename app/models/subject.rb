class Subject < ApplicationRecord
  has_many :pages

  validates_presence_of :name

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('subjects.position ASC') }
  scope :newest_first, -> { order('subjects.created_at DESC') }
  scope :search, lambda { |query|
    where(['name LIKE ?', "%#{query}%"])
  }
end
