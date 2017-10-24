

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

class CustomerPage <SitePrism::Page
    set_url '/customers'

    section :modal_box, Sections::ModalBox, '.modal-dialog'

    element :new, '#dataview-insert-button'
    element :save, '#form-submit-button'

    element :name, 'input[name=name]'
    element :phone, 'input[name=phone]'
    element :email, 'input[name=email]'
    element :gender_m, 'input[name=radio-m]'
    element :gender_f, 'input[name=radio-f]'
    element :type, '#type-customer'
    element :note, 'textarea[name=note]'
    element :info, '.checkbox input'
    
    element :search_input, 'input[name=search]'
    element :search_button, '#dataview-search-button'

    elements :view, 'table tbody tr'
    
    #element :modal_remove_button, '.modal-dialog button[data-bb-handler=success]'
    element :alert_warning, '.alert-warning'

    def select_gender (gender)
        self.gender_m.click if gender == 'M'
        self.gender_f.click if gender == 'F'
    end

    def select_type(target)
        self.type.find('option', text: target).select_option
    end

    def remove_item
        self.view.first.find('span[class*=trash]').click
    end

end