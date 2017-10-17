

class LoginPage <SitePrism::Page
    set_url '/login'
    element :email, '#email'
    element :password, 'input[type=password]'
    element :sign_in, 'button[class*=login-button]'
    element :message_error, '#login-errors'

    def do_login (user)
        self.email.set user['email']
        self.password.set user['senha']
        self.sign_in.click
    end

end

class DashPage <SitePrism::Page
    element :title, '#content h3'
    element :title_row, '#title_row'
end

class NavPage <SitePrism::Page
    element :usermenu, '#usermenu'
    element :logout, 'a[href$="/logout"]'

    #custom actions
    def do_logout
        self.usermenu.click
        self.logout.click
    end
end