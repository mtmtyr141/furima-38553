require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
     sleep 1.5
  end

  describe '商品購入機能' do

    context '購入できるとき' do

      it '全てが存在すれば購入できること' do
        expect(@order_address).to be_valid
      end

      it 'buildingがなくても登録できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    
    end


    context '購入できないとき' do

     it 'postalが空では登録できないこと' do
       @order_address.postal = ''
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Postal can't be blank")
     end

     it 'postalはハイフンが必要であること' do
      @order_address.postal = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
     end

     it 'areaが空では登録できないこと' do
      @order_address.area_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area must be other than 0")
    end

    it 'cityが空では登録できないこと' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'blockが空では登録できないこと' do
      @order_address.block = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end

     it 'phonenumberが空では登録できないこと' do
      @order_address.phonenumber = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phonenumber can't be blank")
    end

    it 'phonenumberは半角数字のみでないと登録できないこと' do
      @order_address.phonenumber = '11111aaaaaa'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phonenumber is invalid")
    end

    it 'phonenumberは全角数字だと登録できないこと' do
      @order_address.phonenumber = '１１１１１１１１１１１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phonenumber is invalid")
    end

    it 'phonenumberは12桁以上だと登録できないこと' do
      @order_address.phonenumber = '111111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phonenumber is invalid")
    end

    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "user_idが空では登録できないこと" do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空では登録できないこと" do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'phonenumberは9桁以下では登録できない' do
      @order_address.phonenumber = '11111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phonenumber is invalid")
    end



    end
  end
end

