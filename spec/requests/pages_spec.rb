require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe '#home' do
    it 'リクエストが成功する事' do
      get home_path
      expect(response.status).to eq 200
    end
  end

  describe '#about' do
    it 'リクエストが成功する事' do
      get about_path
      expect(response.status).to eq 200
    end
  end

  describe '#terms' do
    it 'リクエストが成功する事' do
      get terms_path
      expect(response.status).to eq 200
    end
  end
end
