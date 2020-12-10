require 'rails_helper'
 RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end

   describe 'ユーザー新規登録' do
     it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it "emailは、＠を含まないと登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
     end
     it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
     end  
     it "passwordは、6文字以上で、半角英数混合でないと登録できない" do
        @user.password = "00000"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)", "Password パスワードには英字と数字の両方を含めて設定してください"
     end
     it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
      @user.last_name, @user.first_name = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください", "First name can't be blank", "First name 全角文字を使用してください")
   end
   end
 end