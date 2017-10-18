
Before do
    @login = LoginPage.new
    @dash = DashPage.new
    @nav = NavPage.new
    @customer = CustomerPage.new
end


After ('@logout') do
    @nav = NavPage.new
    @nav.do_logout
end