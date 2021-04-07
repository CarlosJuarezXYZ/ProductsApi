class User < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :username, presence: true
  validates :gender, presence: true,
                     inclusion: { in: %w[male female other],
                                  message: '%{value} is not a valid gender' }
  validates :password, presence: true, length: { minimum: 6 }, if: :password

  def invalidate_token
    update(token: nil)
  end

  def self.valid_login?(username, password)
    user = find_by(username: username)
    user&.authenticate(password)
  end
end
