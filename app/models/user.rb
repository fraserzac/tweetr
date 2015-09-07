# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
	has_secure_password

	validates :email, :presence => true
	validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 3 }
end
