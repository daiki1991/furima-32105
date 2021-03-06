class User < ApplicationRecord
  has_many :items
  has_many :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
     
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'パスワードには半角の英字と数字の両方を含めて設定してください'         
  validates :encrypted_password, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end
  with_options presence: true do
    validates :nickname
    validates :email
    validates :birthday
  end
  
end
