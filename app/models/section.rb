class Section < ApplicationRecord
  has_many :section_edits
  has_many :editors, through: :section_edits, class_name: 'AdminUser'
  belongs_to :page

  CONTENT_TYPES = %w[text HTML]

  validates_presence_of :name
  validates_length_of :name, maximum: 255
  validates_inclusion_of :content_type, in: CONTENT_TYPES, message: "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content

  scope :visible, -> {where(visible: true)}
  scope :invisible, -> {where(visible: false)}
  scope :sorted, -> {order('sections.position ASC')}
  scope :newest_first, -> {order('sections.created_at DESC')}
  scope :search, lambda { |query|
    where(['name LIKE ?', "%#{query}%"] )
  }

end
