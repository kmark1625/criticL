require "rails_helper"

describe UsersController do
  let!(:user) { User.create!(username: "user", email: "user@user.com", password: "password")}

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(user).to render_template("new")
    end
  end

  describe "GET #show" do
    it "assigns requested user as @user" do
      get :show, { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new user" do
        post :create, user: { username: "user", email: "user@user.com", password: "password" }
        expect(user).to be_a(User)
      end

      it "assigns a new user as @user" do
        post :create, user: { username: "user1", email: "user1@user.com", password: "password" }
        expect(assigns(:user)).to eq(User.last)
      end

      it "redirects to user profile" do
        post :create, user: { username: "user2", email: "user2@user.com", password: "password" }
        expect(user).to redirect_to(User.last)
      end
    end
  end

end