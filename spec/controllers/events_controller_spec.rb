require 'rails_helper'
require 'pry'

describe EventsController do
  def stub_current_user user
    ApplicationController.any_instance.stub(:current_user) { user }
  end

  let(:user) {User.create(name: "pascaline", email: "boss@ladysomm.com", password: "test", password_confirmation: "test")}
  let(:an_event) {Event.create(name: "Great Tasting", location: "48 Wall St, NY, NY", date: "2014-10-30 20:45:00", time: "2014-10-30 20:45:00", creator: user)}

  context 'GET #new' do
    it "assigns a new event to @event" do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  context 'GET #edit' do
    it "assigns the requested event to @event" do
      stub_current_user(user)
      get :edit, id: an_event
      expect(assigns(:event)).to eq an_event
    end

    it "redirects with no valid user " do
      get :edit, id: an_event
      expect(response).to redirect_to root_path
    end

    it "renders the :edit template" do
      stub_current_user(user)
      get :edit, id: an_event
      expect(response).to render_template :edit
    end
  end
end
