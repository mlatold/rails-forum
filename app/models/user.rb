class User < ActiveRecord::Base
  validates :name, presence: true, length: { in: 3..25, },
                    uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /.+@.+/i },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }



  private
    def generate_hash
      Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
    end
end
