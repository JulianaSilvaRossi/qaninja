

module Sections

    class NavBar <SitePrism::Section
        element :usermenu, '#usermenu'
        element :logout, 'a[href$="/logout"]'
    
        #custom actions
        def do_logout
            self.usermenu.click
            self.logout.click
        end
    end

    class ModalBox < SitePrism::Section
        element :remove_yes, 'button[data-bb-handler=success]'
    end

end