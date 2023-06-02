class User < ActiveRecord::Base
  has_secure_password
  def self.authenticate_user(email, password)
    email = email
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
