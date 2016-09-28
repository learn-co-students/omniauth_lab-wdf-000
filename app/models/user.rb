class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth_hash)
    # finding by uid instead of email since the tests check for uid first
    where(uid: auth_hash[:uid]).first_or_create do |user|
      user.name = auth_hash[:info][:name]
      user.email = auth_hash[:info][:email]
    end
  end

end
