require 'rails_helper'

RSpec.describe Coordinator, type: :model do
  it "名前、ユーザー名、性別、誕生日、職業、メール、パスワードがある場合、有効である" do
    expect(FactoryBot.create(:coordinator)).to be_valid
  end
  it "名前がない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, name: nil)
    expect(coordinator).not_to be_valid
  end
  it "ユーザー名がない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, user_name: nil)
    expect(coordinator).not_to be_valid
  end
  it "性別がない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, sex: nil)
    expect(coordinator).not_to be_valid
  end
  it "誕生日がない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, birthday: nil)
    expect(coordinator).not_to be_valid
  end
  it "職業がない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, occupation: nil)
    expect(coordinator).not_to be_valid
  end
  it "メールアドレスがない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, email: nil)
    expect(coordinator).not_to be_valid
  end
  it "重複したメールアドレスの場合、無効である" do
    coordinator1 = FactoryBot.create(:coordinator, email: "abc@xxx.com")
    coordinator2 = FactoryBot.build(:coordinator, email: "abc@xxx.com")
    expect(coordinator2).not_to be_valid
  end
  it "パスワードがない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, password: nil)
    expect(coordinator).not_to be_valid
  end
end
