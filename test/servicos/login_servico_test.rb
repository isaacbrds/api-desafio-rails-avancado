require "test_helper"

class LoginServicoTest < ActiveSupport::TestCase
  test 'Precisa validar o administrador cadastrado no bd' do 
    adm, token = LoginServico.login('admin@mail.com', '123456')
    assert_not_nil adm, "Objeto administrador não deve ser nulo"
    assert_equal "admin@mail.com", adm.email, "O email do administrador deve ser 'admin@mail.com'"
    
    assert_not_nil token, "O token jwt não deve ser nulo"

    assert_not_nil adm.id, "O administrador precisa ter um id"
  end

  test 'Comparando o token' do 
    adm, token = LoginServico.login('admin@mail.com', '123456')
    
    adm_novo = TokenJwtServico.decode(token)

    assert_not_nil adm_novo, "Objeto administrador não deve ser nulo"
    assert_equal adm_novo.email, adm.email, "O email do administrador deve ser 'admin@mail.com'"
    assert_equal adm.id, adm_novo.id, "Os administradores precisam ter o mesmo id"
  end
end