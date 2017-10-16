#encoding: utf-8

Dado("que tenho os seguintes dados de acesso:") do |table|                    
    @user = table.rows_hash
    # @email = table.rows_hash['email']
    # @password = table.rows_hash['senha']
    visit '/login'
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

  # tentativas de acesso
  Então("vejo a mensagem de alerta {string}") do |message|
    message_error = find('#login-errors').text
    expect(message_error).to eql message
  end