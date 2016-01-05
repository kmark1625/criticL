require 'rails_helper'

describe User do
  let(:user) { User.new }
  it "creates a valid user" do
    user = User.new(username: "test", email: "test@test.com", password: "password")
    expect(user.valid?).to be true
  end

  it "recognizes an invalid email" do
    user = User.new(username: "test", email: "test", password: "password")
    expect(user.valid?).to be false
  end
end