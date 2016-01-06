require 'rails_helper'
describe UsersHelper do
  before(:each) do
    @user = User.create!(username: "test", email: "test@test.com", password: "password")
  end
  describe "#current_user" do
    it "returns the user who is currently logged in" do
      session[:user_id] = @user.id
      expect(current_user).to eq(@user)
    end
    it "returns nil if there is no current user" do
      expect(current_user).to be nil
    end
  end

  describe "#logged_in?" do
    it "returns true if there is a current user" do
      session[:user_id] = @user.id
      expect(logged_in?).to be true
    end
    it "returns false is there is no current user" do
      expect(logged_in?).to be false
    end
  end
end