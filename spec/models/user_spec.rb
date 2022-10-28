require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できない場合' do

      it "nameが必須であること" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    
      it 'emailが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailは、@が含む必要があること' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは、6文字以下での入力が必須であること' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英数字の混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end

      it 'passwordとpassword_confirmationは値の一致が必須であること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'firstnameが英数字では登録できない' do
        @user.firstname = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid. Input full-width characters.')
      end
      
      it 'lastnameが英数字では登録できない' do
        @user.lastname = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters.")
      end
     
      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end

      it 'lastname_kanaが空だと登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end

      it 'firstname_kanaが英数字だと登録できない' do
        @user.firstname_kana = 'aaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters.")
      end

      it 'firstname_kanaが漢字だと登録できない' do
        @user.firstname_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters.")
      end
      
      it 'lastname_kanaが英数字だ登録できない' do
        @user.lastname_kana = 'aaaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid. Input full-width katakana characters.")
      end
      it 'lastname_kanaが漢字だと登録できない' do
        @user.lastname_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid. Input full-width katakana characters.")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end


      it 'emailは一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end


      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは全角では登録できないこと' do
        @user.password = 'aaa１１１'
        @user.password_confirmation = 'aaa１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end






    end
  end
end