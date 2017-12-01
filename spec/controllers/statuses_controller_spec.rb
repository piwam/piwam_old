require 'rails_helper'

describe StatusesController do

  let(:valid_attributes) { { label: 'President' } }
  let(:invalid_attributes) { { label: nil } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      status = Status.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      status = Status.create! valid_attributes
      get :show, params: { id: status.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      status = Status.create! valid_attributes
      get :edit, params: { id: status.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Status' do
        expect {
          post :create, params: { status: valid_attributes }, session: valid_session
        }.to change(Status, :count).by(1)
      end

      it 'redirects to the created status' do
        post :create, params: { status: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Status.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: { status: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { label: 'New label' } }

      it 'updates the requested status' do
        status = Status.create! valid_attributes
        put :update, params: { id: status.to_param, status: new_attributes }, session: valid_session
        status.reload
        expect(status.label).to eq('New label')
      end

      it 'redirects to the status' do
        status = Status.create! valid_attributes
        put :update, params: { id: status.to_param, status: valid_attributes }, session: valid_session
        expect(response).to redirect_to(status)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the "edit" template)' do
        status = Status.create! valid_attributes
        put :update, params: { id: status.to_param, status: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested status' do
      status = Status.create! valid_attributes
      expect {
        delete :destroy, params: { id: status.to_param }, session: valid_session
      }.to change(Status, :count).by(-1)
    end

    it 'redirects to the statuses list' do
      status = Status.create! valid_attributes
      delete :destroy, params: { id: status.to_param }, session: valid_session
      expect(response).to redirect_to(statuses_url)
    end
  end

end
