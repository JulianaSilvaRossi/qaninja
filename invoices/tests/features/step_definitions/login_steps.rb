#encoding: utf-8

Dado("Usuário acessa página login") do
    login.load
end

# Dado("que tenho os seguintes dados de acesso:") do |table|                    
#     @user = table.rows_hash
#     # @email = table.rows_hash['email']
#     # @password = table.rows_hash['senha']
#   end    
  
  Dado("que eu tenho um usuário com perfil {string}") do |perfil|
    @user = $data['users'][perfil]
  end
                                                                                
  Quando("faço login") do                                                       
    login.do_login(@user)
  end
  
  Então("vejo o Dashboard com a mensagem {string}Invoices{string}") do |msg1, msg2|
    expect(dash.title.text).to eql "Dashboard"
    expect(dash.title_row.text).to have_content "#{msg1} #{@user['name']}#{msg2}"
  end
                                                                                
  # Então("vejo o Dashboard com a mensagem {string}") do |welcome|                 
  #   expect(dash.title.text).to eql "Dashboard"
  #   expect(dash.title_row.text).to have_content welcome
  # end   

  
  
  Então("vejo o email do usuário logado") do
    expect(dash.nav.usermenu.text).to eql @user['email']
  end

  # Exemplo Cenário Expressivo na mão - usando laço for each e array
  Dado("que eu tenho os seguintes dados:") do |table|
      @users = table.hashes
      # puts @users = table.hashes    
      # puts @users.class
  end
  
  Quando("faço a tentativa de login") do
    @message_list = Array.new
    @message_spec = Array.new
    
    @users.each do |user|
      login.do_login(user)
      @message_list.push(login.message_error.text)
      @message_spec.push(user['mensagem'])
    end
  end
  
  Então("vejo a mensagem de erro de login") do
    puts @message_list
    puts @message_spec
    expect(@message_list).to eql @message_spec
  end

  # Exemplo Cenário Expressivo:
  # Dado("que tenho um {string} e {string}") do |email, password|
  #     @user = {'email' => email, 'senha' => password}
  # end
  
  # Então("vejo a {string} de alerta") do |message|
  #      message_error = find('#login-errors').text
  #      expect(message_error).to eql message
  #      sleep(3)
  # end

  # # tentativas de acesso
  # Então("vejo a mensagem de alerta {string}") do |message|
  #   message_error = find('#login-errors').text
  #   expect(message_error).to eql message
  # end

  # # exemplo tentativa de login passando parâmetro
  # Dado("que tenho {string} e {string}") do |email, password|                                       
  #   @user = {'email' => email, 'senha' => password}
  #   visit '/login'
  # end                                                                             
                                                                                  
  # Então("vejo a {string} de alerta") do |message|
  #   message_error = find('#login-errors').text
  #   expect(message_error).to eql message
  #   sleep(3)
  # end                                                                             
                                                                                  