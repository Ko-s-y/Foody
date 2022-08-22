require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'ページのタイトルを動的に表示する機能 full_title メソッドについて' do
    context 'page_titleがtestの場合' do
      it 'full_titleは「test - Foody!」である事' do
        expect(full_title('test')).to eq 'test - Foody!'
      end
    end

    context 'page_titleがnilの場合' do
      it 'full_titleは「Foody!」である事' do
        expect(full_title(nil)).to eq 'Foody!'
      end
    end

    context 'page_titleが空白の場合' do
      it 'full_titleは「Foody!」である事' do
        expect(full_title('')).to eq 'Foody!'
      end
    end
  end
end
