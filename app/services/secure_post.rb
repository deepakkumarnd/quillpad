require 'util/secure'

class SecurePost

  def initialize(user, post)
    @user = user
    @post = post
    raise InvalidPostKindError if !@post.secure?
  end

  def encrypt
    @post.content = Util::Secure.encrypt(@post.content, @user.enc_key, @user.enc_iv)
    @post
  end

  def decrypt
    @post.content = Util::Secure.decrypt(@post.content, @user.enc_key, @user.enc_iv)
    @post
  end
end