module ApplicationHelper
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
end
