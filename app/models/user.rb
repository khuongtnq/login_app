class User < ApplicationRecord
	class <<self
		def import_file file
			spreadsheet = Roo::Spreadsheet.open file
			header = spreadsheet.row 1
			(2..spreadsheet.last_row).each do |i|
				row = [header, spreadsheet.row(i)].transpose.to_h
				create! row
			end
		end
	end
	has_secure_password
	attr_accessor :remember_token, :activation_token
	before_save :downcase_email
	# before_create :create_activation_digest
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	has_many :access_tokens, class_name: "Doorkeeper::AccessToken",
    foreign_key: :resource_owner_id, dependent: :destroy
	has_many :books, dependent: :destroy
    class <<self
    	def authenticate params
    		user = User.find_by name: params[:name]
    		return false unless user
    			user.authenticate params[:password]
			end

		end

	after_create :send_welcome_email
	private
		def send_welcome_email
			NotificationMailer.new_account(self).deliver
		end
		def downcase_email
			self.email = email.downcase
		end

		def create_activation_digest
			self.activation_token = User.new_token
			self.activation_digest = User.digest(activation_token)
		end
end
