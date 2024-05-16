require "test_helper"

class TokenJwtServicoTest < ActiveSupport::TestCase
  test "Verificar token sem tempo de expiracao" do
    token = TokenJwtServico.encode(Administrador.first)
    assert_not_nil token, "O token jwt não deve ser nulo"
  end

  test "Verificar token com tempo de expiracao" do
    token = TokenJwtServico.encode(Administrador.first, (Time.zone.now - 10.seconds) )
    adm = TokenJwtServico.decode(token)
    assert_not_nil token, "O token jwt não deve ser nulo"
    assert_nil adm, "O adm deve ser nulo"
 end
end