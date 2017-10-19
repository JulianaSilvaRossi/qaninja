#encoding: utf-8

Dado("Usuário acessa cadastro de clientes") do
  @customer.load
end

  Dado("que tenho um novo cliente com os seguintes atributos:") do |table|
    
    @new_customer = table.rows_hash    
  end
  
  Quando("faço o cadastro desse cliente") do
    @customer.new.click
    @customer.name.set @new_customer['name']
    @customer.phone.set @new_customer['phone']
    @customer.email.set @new_customer['email']
    @customer.note.set @new_customer['note']
    @customer.save.click
    
  end
  
  Então("este cliente deve ser exibido na busca") do
    @customer.search_input.set @new_customer['email']
    @customer.search_button.click
    sleep(5)
  end
  