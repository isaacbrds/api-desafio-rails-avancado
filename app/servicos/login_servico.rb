module LoginServico
  def self.login(email, senha)
    adm = Administrador.where(email: email).first
    raise LoginError.new("Email não encontrado") if adm.blank?
    raise LoginError.new("Email ou senha não confere")if adm.senha != CriptoSenha.encriptar(senha)
    
    [adm, TokenJwtServico.encode(adm)]
  end
end