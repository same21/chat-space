require 'rails_helper'

describe MessagesController, type: :controller do
    let(:group) {create(:group)}
    let(:user) {create(:user, group_ids: group.id)}
    let!(:message){ create(:message, group_id: group.id, user_id: user.id) }
    let(:create_params){ { body: message.body, group_id: message.group.id, user_id: message.user.id } }

  before do
    login_user user
  end

  describe 'GET #index' do

    it 'assinges the requested contact to @group' do
      get :index, params: { group_id: group }
      expect(assigns(:group)).to eq group
    end

    it 'assinges the requested contact to @group_users' do
      get :index, params: { group_id: group }
      group_users = group.users
      expect(assigns(:group_users)).to eq group_users
    end

    it 'assinges the requested contact to @group_messages' do
      get :index, params: { group_id: group }
      group_messages = group.messages
      expect(assigns(:group_messages)).to eq group_messages
    end

    it "assigns the requested contact to @groups" do
      get :index, params: { group_id: group }
      groups = user.groups
      expect(assigns(:groups)).to eq groups
    end

    it "renders the :index template" do
      get :index, params: { group_id: group }
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do

    it 'saves the new message in the DB' do
      expect{post :create, params: { group_id: group, message: create_params}}.to change( Message, :count ).by(1)
    end

    it "renders the :index template" do
      post :create, params: { group_id: group, message: create_params}
      expect(response).to render_template :index
    end

    it 'appears a notice flash message when new message saved' do
      post :create, params: { group_id: group, message: create_params}
      expect(flash[:notice]).not_to be_empty
    end

    it 'is not saved the new message in the DB' do
      expect{post :create, params: { group_id: group, message: attributes_for(:message, body: "")}}.to change( Message, :count ).by(0)
    end

    it "renders the :index template" do
      post :create, params: { group_id: group, message: attributes_for(:message, body: "")}
      expect(response).to render_template :index
    end

    it 'appears a alert flash message when new message is not saved' do
      post :create, params: { group_id: group, message: attributes_for(:message, body: "")}
      expect(flash[:alert]).not_to be_empty
    end
  end

end
