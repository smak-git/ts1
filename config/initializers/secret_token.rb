# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Ts1::Application.config.secret_key_base = '8efc5f968b69fdd8616fb1baa8c9f16b6c7ca55bc4bec300b0a0f98738e758522ba8b066ae9ed52964ffca3fa19d16edf018a79d811d76058f190f569cb1c8f0'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token
		File.read(token_file).chomp
	else
		#Generate a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

Ts1::Application.config.secret_key_base = secure_token
