class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    #validates :lastname,        format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is invalid. Input full-width characters.' }
    #validates :firstname,       format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'is invalid. Input full-width characters.' }
    #validates :lastnamedetail,  format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width characters.' }
    #validates :firstnamedetail, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :lastname,        format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'が不正です。 全角文字を入力してください' }
    validates :firstname,       format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'が不正です。 全角文字を入力してください' }
    validates :lastnamedetail,  format: { with: /\A[ァ-ヶー－]+\z/, message: 'が不正です。 全角カタカナを入力してください' }
    validates :firstnamedetail, format: { with: /\A[ァ-ヶー－]+\z/, message: 'が不正です。 全角カタカナを入力してください' }

    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  #validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は英数字両方を入力してください'
  has_many :items
  has_many :orders
end
