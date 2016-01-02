class User < ActiveRecord::Base

  before_create :confirmation_token

  # -- VALIDATIONS -- #
  # Must use this so we can customize error messages
  has_secure_password validations: false

  validates :email,    presence: { message: 'You must provide an email' },
                       format: { with: /@/, message: 'Please enter a valid email' },
                       uniqueness: { message: 'This email has been taken' }
  # We just need a name to exist for now
  validates :name,     presence: { message: 'You must enter your first name' }

  validates :password,  presence: { message: 'You must enter a password',
                                         on: :create },
                          length: { minimum: 8,
                                    message: 'Your password is too short',
                                         on: :create }


  # -- CUSTOM FUNCTIONS -- #

  # When called, activates their account and remove the token from the database
  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    # Redundant, but makes sure we don't run into password validation issues
    save!(validate: false)
  end

  private

  def confirmation_token
    if confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
