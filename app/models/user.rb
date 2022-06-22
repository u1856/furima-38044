class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :destinations

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]/ } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end

  VALID_PASSWORD_REGEX =  /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
end
