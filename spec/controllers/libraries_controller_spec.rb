require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do

  describe "GET #index" do
    it "returns success response" do 
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do 
    let!(:library) { create(:library) } 
    it "returns success response" do
      get :show, params: {id: library.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do  
    it "returns success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end
  
  describe "GET #edit" do 
    let!(:library) { create(:library) } 
    it "returns success response" do
      get :edit, params: {id: library.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let!(:library_attributes){ attributes_for(:library) }
      it "creates a new library" do
        expect{
          post :create, params: {library: library_attributes}
        }.to change(Library, :count).by(1)
      end

      it "redirect to the libraries index" do
        post :create, params: {library: library_attributes}
        expect(response).to redirect_to(libraries_path)
      end
    end

    context "with invalid params" do
      let!(:invalid_library_attributes){ attributes_for(:library) }
      it "returns a success response (i.e. to display the 'new' template)" do
        invalid_library_attributes[:name] = nil
        post :create, params: {library: invalid_library_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let!(:library) { create(:library) }
      let!(:library_updated_attributes){ attributes_for(:library) }
      it "update a new library" do
        put :update, params: {id: library.id, library: library_updated_attributes}
      end

      it "redirect to the libraries index" do
        put :update, params: {id: library.id, library: library_updated_attributes}
        expect(response).to redirect_to(libraries_path)
      end
    end

    context "with invalid params" do
      let!(:library) { create(:library) }
      let!(:invalid_library_attributes){ attributes_for(:library) }
      it "returns a success response (i.e. to display the 'edit' template)" do
        invalid_library_attributes[:name] = nil
        post :update, params: {id: library.id, library: invalid_library_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:library) { create(:library) }
    it "destroys the requested library" do
      expect {
        delete :destroy, params: {id: library.id}
      }.to change(Library, :count).by(-1)
    end
    let!(:library) { create(:library) }
    it "redirect to the libraries index" do
      delete :destroy, params: {id: library.id}
      expect(response).to redirect_to(libraries_path)
    end
  end

end
