# encoding: utf-8

class Profile < ActiveRecord::Base
	validates :user_id, :profile_name, presence: true
	belongs_to :user

	def to_param
   	  "#{id} #{self.user.profile.profile_name}".parameterize
	end
end