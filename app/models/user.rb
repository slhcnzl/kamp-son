# encoding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_many :notices, dependent: :destroy
  has_one :profile, dependent: :destroy

  after_create :make_profile, on: :create

  def make_profile
    create_profile(
      profile_name: "",
      phone_number: "",
      city: "",
      town: "",
      address: ""
    )
  end

  def full_name
    first_name + " " + last_name
  end
end