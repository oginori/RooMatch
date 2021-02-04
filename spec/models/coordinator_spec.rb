require 'rails_helper'

RSpec.describe Coordinator, type: :model do
  it "名前、ユーザー名、性別、誕生日、職業、メール、パスワードがある場合、有効である" do
    expect(FactoryBot.create(:coordinator)).to be_valid
  end
  it "メールアドレスがない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, email: nil)
    coordinator.valid?
    expect(coordinator.errors[:email]).to include("can't be blank")
  end
  it "重複したメールアドレスの場合、無効である" do
    coordinator1 = FactoryBot.create(:coordinator, email: "abc@xxx.com")
    coordinator2 = FactoryBot.build(:coordinator, email: "abc@xxx.com")
    coordinator2.valid?
    expect(coordinator2.errors[:email]).to include("has already been taken")
  end
  it "パスワードがない場合、無効である" do
    coordinator = FactoryBot.build(:coordinator, password: nil)
    coordinator.valid?
    expect(coordinator.errors[:password]).to include("can't be blank")
  end
end
