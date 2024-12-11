class Building < ApplicationRecord
    has_many :apartments, dependent: :destroy
    has_and_belongs_to_many :features

    validates :nombre, presence: true
    validates :direccion, presence: true

    scope :total_edificios, -> { count }
end
