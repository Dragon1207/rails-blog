ActiveAdmin.register Header2 do

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    permit_params :description
    
    searchable_select_options(scope: -> { Header2.all }, text_attribute: :description)
  
    index do
      selectable_column
      id_column
      column :description
      actions defaults: false do |description|
        item 'View', admin_header2_path(description), class: 'member_link'
        item 'Edit', edit_admin_header2_path(description), class: 'member_link'
      end
    end
    
  end
  