require 'bcrypt'

module CriptoSenha
  def self.salt
      salt = "$2a$12$DVmymbqnQbGvuZzedcSI1O"
  end

  def self.encriptar(password)
      #salt = BCrypt::Engine.generate_salt

      senha_hashed = BCrypt::Engine.hash_secret(password, CriptoSenha.salt)

      senha_hashed
  end
end