#encoding: utf-8
Dado("Usuário acessa página login") do
  visit '/login'
end

Dado("que tenho os seguintes dados de acesso:") do |table|                    
    @user = table.rows_hash
    # @email = table.rows_hash['email']
    # @password = table.rows_hash['senha']
    
  end                                                                           
                                                                                
  Quando("faço login") do                                                       
    find('#email').set @user['email']
    find('input[type=password]').set @user['senha']
    find('button[class*=login-button]').click
  end                                                                           
                                                                                
  Então("vejo o Dashboard com a mensagem {string}") do |welcome|                 
    title = find('#content h3').text
    expect(title).to eql "Dashboard"

    title_row = find('#title_row').text
    expect(title_row).to have_content welcome
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
      find('#email').set user['email']
      find('input[type=password]').set user['senha']
      find('button[class*=login-button]').click

      @message_list.push(find('#login-errors').text)
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
                                                                                  