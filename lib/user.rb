require 'bcrypt'

class User

attr_reader :password
attr_accessor :password_confirmation

include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true, :message => "This email is already taken"
  property :password_digest, Text
  property :username, String

  def password=(password)
  	@password = password
    self.password_digest = BCrypt::Password.create(password)
  end

	validates_confirmation_of :password
	validates_uniqueness_of :email
	validates_uniqueness_of :username

	def self.authenticate(email, password)
	  # that's the user that's trying to sign in
	  user = first(:email => email)
	  # if this user exists and the password provided matches
	  # the one we have password_digest for, everything's fine
	  #
	  # The Password.new returns an object that overrides the ==
	  # method. Instead of comparing two passwords directly
	  # (which is impossible because we only have a one-way hash)
	  # the == method calculates the candidate password_digest from
	  # the password given and compares it to the password_digest
	  # it was initialised with.
	  # So, to recap: THIS IS NOT A STRING COMPARISON 
	  if user && BCrypt::Password.new(user.password_digest) == password
	    # return this user
	    user
	  else
	    nil
	  end
	end

	module BCrypt
  	class Password
    def initialize(digest)
        @digest = digest
    end
    def ==(password)        
        @digest == digest(salt(@digest), password)
    end
    def digest(salt, password)
        # compute the digest
        # by using bcrypt magic.
        # return something like
        # "$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yKUOYTa"
    end
  end
end


end
