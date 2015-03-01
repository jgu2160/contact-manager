require 'rails_helper'

RSpec.describe EmailsController, type: :controller do
  let(:valid_attributes) {
    {address: "jgu@gooby.com", contact_id: alice.id, contact_type: 'Person'}
  }
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
  let(:bob) { Person.create(first_name: 'Bob', last_name: 'Gu') }
  let(:invalid_attributes) {
    { number: nil, contact_id: nil, contact_type: nil }
  }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all emails as @emails" do
      email = Email.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:emails)).to eq([email])
    end
  end

  describe "GET #show" do
    it "assigns the requested email as @email" do
      email = Email.create! valid_attributes
      get :show, {:id => email.to_param}, valid_session
      expect(assigns(:email)).to eq(email)
    end
  end

  describe "GET #new" do
    it "assigns a new email as @email" do
      get :new, {}, valid_session
      expect(assigns(:email)).to be_a_new(Email)
    end
  end

  describe "GET #edit" do
    it "assigns the requested email as @email" do
      email = Email.create! valid_attributes
      get :edit, {:id => email.to_param}, valid_session
      expect(assigns(:email)).to eq(email)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Email" do
        expect {
          post :create, {:email => valid_attributes}, valid_session
        }.to change(Email, :count).by(1)
      end

      it "assigns a newly created email as @email" do
        post :create, {:email => valid_attributes}, valid_session
        expect(assigns(:email)).to be_a(Email)
        expect(assigns(:email)).to be_persisted
      end

      it "redirects to the created email" do
        post :create, {:email => valid_attributes}, valid_session
        expect(response).to redirect_to(person_path(alice))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved email as @email" do
        post :create, {:email => invalid_attributes}, valid_session
        expect(assigns(:email)).to be_a_new(Email)
      end

      it "re-renders the 'new' template" do
        post :create, {:email => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {address: "jgu@ruby.com", contact_id: alice.id} }

      it "updates the requested email" do
        email = Email.create! valid_attributes
        put :update, {:id => email.to_param, :email => new_attributes}, valid_session
        email.reload
        expect(email.address).to eq('jgu@ruby.com')
      end

      it "assigns the requested email as @email" do
        email = Email.create! valid_attributes
        put :update, {:id => email.to_param, :email => valid_attributes}, valid_session
        expect(assigns(:email)).to eq(email)
      end

      it "redirects to the email" do
        email = Email.create! valid_attributes
        put :update, {:id => email.to_param, :email => valid_attributes}, valid_session
        expect(response).to redirect_to(alice)
      end
    end

    context "with invalid params" do
      it "assigns the email as @email" do
        email = Email.create! valid_attributes
        put :update, {:id => email.to_param, :email => invalid_attributes}, valid_session
        expect(assigns(:email)).to eq(email)
      end

      it "re-renders the 'edit' template" do
        email = Email.create! valid_attributes
        put :update, {:id => email.to_param, :email => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested email" do
      email = Email.create! valid_attributes
      expect {
        delete :destroy, {:id => email.to_param}, valid_session
      }.to change(Email, :count).by(-1)
    end

    it "redirects to the emails list" do
      email = Email.create! valid_attributes
      delete :destroy, {:id => email.to_param}, valid_session
      expect(response).to redirect_to(alice)
    end
  end

end
