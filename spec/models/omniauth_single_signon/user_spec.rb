require 'spec_helper'

describe User do
  let(:user) { create :user, email:"joe@somewhere.com"}

  subject { user }

  let(:auth_hash) {
    {
      :provider => 'investopresto',
      :uid => user.id,
      :info => {
        :email => 'joe@somewhere.com'
      }
    }
  }

  it "should find a user by his authentication" do
    User.find_or_create_by_omniauth(auth_hash).should eq user
  end

  context "with new authentication" do
    let(:current_user) { User.find_or_create_by_omniauth(auth_hash) }

    its(:persisted?) { should be_true }
    its(:email) { should eq 'joe@somewhere.com' }
  end
end
