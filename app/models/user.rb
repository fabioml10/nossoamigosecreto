class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #User tem muitas campanhas e quando o user for apagado, as campanhas tbm são
  has_many :campaigns, dependent: :destroy
end
