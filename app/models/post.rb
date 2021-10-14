class Post < ApplicationRecord
    # Validation in rails is SUPER SIMPLE! You can add validation type stuff in model
    # If the controller receives 
    validates :title, presence: true, length: {minimum: 5} 

    has_many :comments
end
