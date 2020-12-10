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
     it "passwordは、6文字以上でないと登録できない" do
        @user.password = "00000"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end
     it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
   end
 end