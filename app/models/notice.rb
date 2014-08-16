# encoding: utf-8

class Notice < ActiveRecord::Base
  validates :title, :message, presence: true
end