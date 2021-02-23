require 'rails_helper'

RSpec.describe Resident, type: :model do
  it "名前、ユーザー名、性別、誕生日、メール、パスワードがある場合、有効である" do
    expect(FactoryBot.create(:resident)).to be_valid
  end
  it "名前がない場合、無効である" do
    resident = FactoryBot.build(:resident, name: nil)
    expect(resident).not_to be_valid
  end
  it "ユーザー名がない場合、無効である" do
    resident = FactoryBot.build(:resident, user_name: nil)
    expect(resident).not_to be_valid
  end
  it "性別がない場合、無効である" do
    resident = FactoryBot.build(:resident, sex: nil)
    expect(resident).not_to be_valid
  end
  it "誕生日がない場合、無効である" do
    resident = FactoryBot.build(:resident, birthday: nil)
    expect(resident).not_to be_valid
  end
  it "メールアドレスがない場合、無効である" do
    resident = FactoryBot.build(:resident, email: nil)
    expect(resident).not_to be_valid
  end
  it "重複したメールアドレスの場合、無効である" do
    coordinator1 = FactoryBot.create(:resident, email: "abc@xxx.com")
    coordinator2 = FactoryBot.build(:resident, email: "abc@xxx.com")
    expect(coordinator2).not_to be_valid
  end
  it "パスワードがない場合、無効である" do
    resident = FactoryBot.build(:resident, password: nil)
    expect(resident).not_to be_valid
  end
end
