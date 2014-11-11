require 'rails_helper'

describe EventWinesController do
	def stub_current_user user
    ApplicationController.any_instance.stub(:current_user) { user }
  end

  let(:user) {User.create(name: "jane doe", email: "jane@example.com", password: "test", password_confirmation: "test")}
  let(:new_event_wine) {EventWine.create()}

  context 'GET #edit' do
  	it "assigns the requested event wine to @event_wine" do
      stub_current_user(user)
      new_event_wine
      get :edit, id: new_event_wine
      expect(assigns(:event_wine)).to eq new_event_wine
    end

    it "renders the :edit template" do
      stub_current_user(user)
      new_event_wine
      get :edit, id: new_event_wine
      expect(response).to render_template :edit
    end
  end
end
