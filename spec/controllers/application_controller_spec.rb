# spec/controllers/application_controller_spec.rb

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    include Devise::Controllers::SignInOut

    def index
      render plain: 'Hello World'
    end
  end

  describe 'GET #index' do
    it 'has sign_in method' do
      expect(controller).to respond_to(:sign_in)
    end
  end
end
