class TokenJwtServico
  def self.segredo
    "api-rails-aprendido-no-torne-se-um-programador"
  end

  def self.encode(administrador, expiracao = nil)
    expiracao = Time.zone.now + 1.hours if expiracao.blank?
    payload = { id: administrador.id, nome: administrador.nome, email: administrador.email, expiracao: expiracao}
    token = JWT.encode(payload, TokenJwtServico.segredo, 'HS256')
  rescue
    nil
  end

  def self.decode(token)
    decode_token = JWT.decode(token, TokenJwtServico.segredo, true, algoritm: 'HS256')
    adm_hash, alg = decode_token
    tempo = Time.parse(adm_hash["expiracao"])
    return nil if tempo < Time.zone.now
    Administrador.find(adm_hash["id"])
  rescue
    nil
  end
end