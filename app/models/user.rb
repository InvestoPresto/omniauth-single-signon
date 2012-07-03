class User < ActiveRecord::Base
  attr_accessible :email
  attr_accessible :name, :avatar_url, :location, :occupation, :company    # Profile Attributes

  def self.find_or_create_by_omniauth(auth_hash)
    where(:id => auth_hash[:uid])
      .first_or_create(:email => auth_hash[:info][:email])
  end
end
