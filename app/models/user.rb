class User < ActiveRecord::Base
  def self.store_user(user_id)
    user = User.find_or_create_by(user_id: user_id)
    user.save
    return user
  end
end
