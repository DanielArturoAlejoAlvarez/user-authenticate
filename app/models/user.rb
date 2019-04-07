class User < ApplicationRecord
    has_secure_password

    validates_length_of :password, maximum: 72, minimum: 6, allow_blank: false, allow_nil: false

    validates_presence_of :username
    validates_presence_of :email

    validates_uniqueness_of :username
    validates_uniqueness_of :email
end
