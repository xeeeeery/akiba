class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise  :database_authenticatable, :registerable,
			:recoverable, :rememberable, :trackable, :validatable,
			:authentication_keys => [:username]

	# usernameを必須とする
	validates_uniqueness_of :username
	validates_presence_of :username

	has_many :items
	has_many :item_comments

	# usernameを利用してログインするようにオーバーライド
	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			# 認証条件
			where(conditions).where(["username = :value", { :value => username }]).first
		else
			where(conditions).first
		end
	end

	# email不要！
	def email_required?
		false
	end

	def email_changed?
		false
	end

end
