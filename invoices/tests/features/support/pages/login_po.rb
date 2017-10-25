require_relative 'sections'

class LoginPage <SitePrism::Page
    set_url '/login'

    section :nav, Sections::NavBar, '#navbar'

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
