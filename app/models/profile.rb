# encoding: utf-8

class Profile < ActiveRecord::Base
	validates :user_id, presence: true
	belongs_to :user
end