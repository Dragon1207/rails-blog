ActiveAdmin.register Tag do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :slug

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  index do
    selectable_column
    id_column
    column :name
    actions defaults: false do |tag|
      item 'View', admin_tag_path(tag), class: 'member_link'
      item 'Edit', edit_admin_tag_path(tag), class: 'member_link'
    end
  end
end
