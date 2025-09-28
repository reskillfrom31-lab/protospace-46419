class Prototype < ApplicationRecord
  # Associations
  belongs_to :user # この行が user の存在を検証してくれます
  has_one_attached :image
  has_many :comments, dependent: :destroy

  # Validations
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end