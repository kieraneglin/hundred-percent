class User < ActiveRecord::Base
  # Must use this so we can customize error messages
  has_secure_password validations: false

  validates :email,    presence: {message: 'You must provide an email'},
                         format: {with: /@/, message: 'Please enter a valid email' }
  # We just need a name to exist for now
  validates :name,     presence: {message: 'You must enter your first name'},
                         format: {with: /([a-zA-Z \-'][^0-9])+/, message: 'Letters and hypens only'}
=begin
  Realistically, the incidence of people using passwords over 72 chars
  is so low that it's not worth it to make a seperate message for that

  TODO: fix this
=end
  validates :password, presence: {message: 'You must enter a password'},
                         length: {in: 8..72,
                                  message: 'Your password is too short'}
end
