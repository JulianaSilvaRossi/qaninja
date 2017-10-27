
# Before do
#     @login = LoginPage.new
#     @dash = DashPage.new
#     @nav = NavPage.new
#     @customer = CustomerPage.new
# end

Before ('@login_adm') do

    # login.load
    # user=$data['users'][perfil]
    #   login.do_login(user)
    #   dash.wait_for_title

    login.load
    user = {
        'email' => 'admin-qa@invoices.com',
        'senha' => 'secret'
      }
      login.do_login(user)
      dash.wait_for_title
end

After ('@logout') do
    dash.nav.do_logout
end

After do |scenario|
    @file_name = scenario.name.downcase!.gsub(' ','_')
    @file_name= @file_name.gsub(',','').gsub('#','')
    @file_name= @file_name.gsub('(','').gsub(')','')

    @target = "reports/screenshots/#{@file_name}.png"

    page.save_screenshot(@target)
    embed(@target, 'image.png','Clique aqui para Evidências')

end