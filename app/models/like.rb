class Like < ApplicationRecord 
    validates :author_id, presence: true
    
    belongs_to :liker,
    foreign_key: :liker_id,
    class_name: :User

    belongs_to :likeable, polymorphic: true
end