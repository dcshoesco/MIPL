# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_MIPL_session',
  :secret      => '2502879b20947a2239849b44bc4e4b43ccebe4494abc2c787a54b1ec91efcea946d6a0d5ab733fda5d3bd4763be379fb4be0c49f4511cb21613890c338505bb9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
