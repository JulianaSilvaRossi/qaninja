
# Before do
#     @login = LoginPage.new
#     @dash = DashPage.new
#     @nav = NavPage.new
#     @customer = CustomerPage.new
# end

Before ('@login_adm') do
    @login.load
    user = {
        'email' => 'admin-qa@invoices.com',
        'senha' => 'secret'
      }
      login.do_login(user)
      dash.wait_for_title
end

After ('@logout') do
    # @nav = NavPage.new
    dash.nav.do_logout
end