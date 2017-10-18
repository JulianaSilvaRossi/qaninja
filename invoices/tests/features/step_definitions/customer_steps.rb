#encoding: utf-8

  Dado("que tenho um novo cliente com os seguintes atributos:") do |table|
    @customer.load
    @new_customer = table.rows_hash    
  end
  
  Quando("faço o cadastro desse cliente") do
    @customer.name.set @new_customer['name']
    @customer.phone.set @new_customer['phone']
    @customer.email.set @new_customer['email']
    @customer.note.set @new_customer['note']
    sleep(2)
  end
  
  Então("este cliente deve ser exibido na busca") do
    pending # Write code here that turns the phrase above into concrete actions
  end
  