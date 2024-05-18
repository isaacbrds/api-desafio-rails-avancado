class AuthenticationController < ApplicationController
  before_action :authentication_request

  private 

  def authentication_request
    auth_header = request.headers['Authorization']

    if auth_header && auth_header.start_with?('Bearer ')
      token = auth_header.split(' ')[1]
      
      token_decodificado = TokenJwtServico.decode(token)
      if token_decodificado.blank?
          render json: { error: 'Acesso Negado'}, status: :unauthorized
      end
    else
      render json: { error: 'Acesso Negado'}, status: :unauthorized
    end
  end
end