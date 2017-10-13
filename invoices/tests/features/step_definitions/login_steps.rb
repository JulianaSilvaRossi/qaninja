#encoding: utf-8

Dado("que tenho os seguintes dados de acesso:") do |table|                    
    @email = table.rows_hash['email']
    @password = table.rows_hash['senha']
    visit 'https://ninjainvoices.herokuapp.com/login'
  end                                                                           
                                                                                
  Quando("faço login") do                                                       
    find('#email').set @email
    find('input[type=password]').set @password
    find('button[class*=login-button]').click
  end                                                                           
                                                                                
  Então("vejo o Dashboard com a mensagem {string}") do |welcome|                 
    title = find('#content h3').text
    expect(title).to eql "Dashboard"

    title_row = find('#title_row').text
    expect(title_row).to have_content welcome
  end                                                                           
                                                                                