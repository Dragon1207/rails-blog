ActiveAdmin.register Typeword do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :typeword
  
  searchable_select_options(scope: -> { Typeword.all }, text_attribute: :typeword)

  index do
    selectable_column
    id_column
    column :typeword
    actions defaults: false do |typeword|
      item 'View', admin_typeword_path(typeword), class: 'member_link'
      item 'Edit', edit_admin_typeword_path(typeword), class: 'member_link'
    end
  end
  
end
