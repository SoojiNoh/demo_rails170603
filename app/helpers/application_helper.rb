module ApplicationHelper
    # def custom_bootstrap_flash
    #   flash_messages = []
    #   flash.each do |type, message|
    #     type = 'success' if type == 'notice'
    #     type = 'error'   if type == 'alert'
    #     text = "<script>toastr.#{type}('#{message}');</script>"
    #     flash_messages << text.html_safe if message
    #   end
    #   flash_messages.join("\n").html_safe
    # end    
    
    def link_to_add_row(name, f, association, **args)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
            render(association.to_s.singularize, f: builder)
        end
        link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n",""), label: args[:label]}) 
    end
    
    def link_to_add_row_category(name, f, association, **args)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
            render("#{association.to_s.singularize}_#{args[:category]}", f: builder)
        end
        link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n",""), label: args[:label]}) 
    end
    
    def link_to_add_row_nested(name, f, association, **args)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
            render(association.to_s.singularize, f: ApplicationController.helpers.send(args[:buildhelper].to_sym, builder))
        end
        link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n",""), label: args[:label]}) 
    end
    
    def link_to_add_form(name, new_object, **args)
        puts params.inspect
        id = new_object.object_id
        forms = form_for(new_object, child_index: id) do |builder|
            render("form_#{new_object.class.name.downcase}", f: builder, artwork: new_object)
        end
        link_to(name, '#', class: "add_forms " + args[:class], data: {id: id, forms: forms.gsub("\n",""), label: args[:label]}) 
    end
    
    def link_to_add_form_parent(name, parent_object, new_object, **args)
        puts params.inspect
        id = new_object.object_id
        forms = form_for([parent_object, new_object], child_index: id) do |builder|
            render("form_#{new_object.class.name.downcase}_#{parent_object.class.name}", f: builder, artwork: new_object)
        end
        link_to(name, '#', class: "add_forms " + args[:class], data: {id: id, forms: forms.gsub("\n",""), label: args[:label]}) 
    end
    
    
    

end
