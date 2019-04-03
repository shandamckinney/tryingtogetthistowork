require 'rails_helper'

describe ProductsController, type: :controller do


  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @admin = FactoryBot.create(:admin)
  end

  context "GET #index" do
    it "renders the product index view" do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context "GET #show" do
    it "renders the products show template" do
      get :show, params: {id: @product.id}
      expect(response).to be_ok
      expect(assigns(:product)).to eq @product
    end
  end

  context "GET #new" do
    it "renders the new product form only when admin is logged in" do
      sign_in @admin
      get :new
      expect(response).to be_ok
    end

    it "does not render new template if admin is not logged in" do
      sign_in @user
      get :new
      expect(response).not_to be_ok
    end
  end

  describe "GET #edit" do
    context 'when an admin is logged in' do
      before do
        sign_in @admin
      end

      it "allows editing product when admin is logged in" do
        get :edit, params: {id: @product.id}
        expect(response).to be_ok
        expect(assigns(:product)).to eq @product
      end

      it "doesn't allow a non admin to edit products" do
        sign_in @user
        get :edit, params: {id: @product.id}
        expect(response).not_to be_ok
      end
    end
  end

  context 'POST #create' do
    it "only allows admins to create new products" do
      sign_in @admin
      @product = FactoryBot.create(:product)
      expect(response).to be_ok
    end
  end

  context "DELETE #destroy" do
    it "only allows admins to destroy products" do
      sign_in @admin
      delete :destroy, params: {id: @product.id}
      expect(response).to redirect_to products_url
    end

    it "does not allow nonadmins to destroy products" do
      sign_in @user
      delete :destroy, params: {id: @product.id}
      expect(response).not_to redirect_to products_url
    end
  end

  context "PUT #update" do
    before do
      @product = FactoryBot.create(:product)
    end

    it "requires an admin to update" do
      sign_in @user
      put :update, params: {id: @product.id}
      expect(response).not_to be_ok
    end
  end
end
