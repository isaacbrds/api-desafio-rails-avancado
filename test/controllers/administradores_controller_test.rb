require 'test_helper'
class AdministradoresControllerTest < ActionDispatch::IntegrationTest
  test "deve retornar o administrador e o token ao efetuar o login" do
    post "/administradores/login", params: { email: 'admin@mail.com', senha: '123456' }

    assert_response :success
    response_body = JSON.parse(response.body)
    assert_not_nil response_body["adm"], "O objeto administrador não deve ser nulo"
    assert_not_nil response_body["token"], "O token JWT não deve ser nulo"
    assert_equal "admin@mail.com", response_body["adm"]["email"], "O email do administrador deve ser 'admin@mail.com'" 
  end

  test "deve retornar o 401 para login inválido" do
    post "/administradores/login", params: {email: 'a@mail.com', senha: '123456'}
    
    assert_response :unauthorized
    response_body = JSON.parse(response.body)
    puts response_body
    assert_equal "Email não encontrado", response_body["erro"], "A mensagem de erro deve ser 'Email não encontrado'" 
  end

  test "deve retornar o 400 para outros erros" do
    post "/administradores/login", params: { email: 'admin@mail.com' }
    
    assert_response :unauthorized
    response_body = JSON.parse(response.body)
    assert_equal "Email ou senha não confere", response_body["erro"], "A mensagem de erro deve ser 'Email ou senha não confere'" 
  end
end