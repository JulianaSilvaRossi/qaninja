#enconding utf-8

#navegar ate a pasta que criei a classe
require_relative '../../../src/forca' 

Quando(/^começo um novo Jogo$/) do
    result = Forca.new
    @message = result.start
  end
  
  Então(/^vejo a mensagem na tela$/) do |msg|
    expect(@message).to eql msg
  end