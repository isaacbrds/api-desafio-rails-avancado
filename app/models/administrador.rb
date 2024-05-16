class Administrador < ApplicationRecord
    before_save :criptografar_senha
    validates :nome, :email, :senha, presence: true
    validates  :email, uniqueness: true

    private

    def criptografar_senha
        self.senha = CriptoSenha.encriptar(self.senha)
    end
end
