# encoding: utf-8

class Notice < ActiveRecord::Base
  validates :title, :message, :user_id, presence: true
  belongs_to :user
end