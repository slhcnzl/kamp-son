# encoding: utf-8

class Notice < ActiveRecord::Base
  validates :title, :message, :user_id, presence: true
  validates :title, length: { maximum: 140, message: "foobar" }
  belongs_to :user
  has_and_belongs_to_many :categories
end