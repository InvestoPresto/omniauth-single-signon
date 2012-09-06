class User < ActiveRecord::Base
  attr_accessible :email
  attr_accessible :name, :avatar_url, :location, :occupation, :company    # Profile Attributes

  attr_accessor :sign_up

  def self.find_or_create_by_omniauth(auth_hash)
    uid = auth_hash[:uid]
    if new_user?(uid)
      user = create(:id => uid, :email => auth_hash[:info][:email])
      user.sign_up = true
    else
      user = find(uid)
      user.sign_up = false
    end

    user
  end

  def self.new_user?(uid)
    where(:id => uid).empty?
  end
end
