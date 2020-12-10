require 'rails_helper'
 RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end

   describe 'ユーザー新規登録' do
      it "nicknameが空では登録できない" do
         @user.nickname = ""
         @user.valid?
         expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "重複したemailは登録できない" do
         @user.save
         another_user = FactoryBot.build(:user, email: @user.email)
         another_user.valid?
         expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "birthdayが空では登録できない" do
         @user.birthday = ""
         @user.valid?
         expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
   
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
     it "passwordは、5文字以下は登録できない" do
        @user.password = "00000"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end
     it "passwordは、英字だけでは登録できない" do
      @user.password = "aaaaa"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include  "Password パスワードには英字と数字の両方を含めて設定してください"
     end
     it "passwordは、数字だけでは登録できない" do
      @user.password = "00000"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include  "Password パスワードには英字と数字の両方を含めて設定してください"
     end
     it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
         @user.last_name = "aa"
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
     end
     it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
         @user.first_name = "aa"
         @user.valid?
         expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
     end
     it "ユーザー本名のフリガナは、全角カタカナでの入力でないと登録できない" do
         @user.last_name_kana = "aa"
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
     end
     it "ユーザー本名のフリガナは、全角カタカナでの入力でないと登録できない" do
         @user.first_name_kana = "aa"
         @user.valid?
         expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
     end
   end
end