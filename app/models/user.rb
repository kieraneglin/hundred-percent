class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :email,    presence: {message: 'You must provide an email'},
                         format: { with: /@/, message: 'Please enter a valid email' }
  # We just need a name to exist for now
  validates :name,     presence: {message: 'You must enter your first name'}

  validates :password, presence: {message: 'You must enter a password'},
                         length: {in: 8..72,
                                  message: 'Your password must contain at least 8 characters'}
end
