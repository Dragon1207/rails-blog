ActiveAdmin.register Category do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :slug

  searchable_select_options(scope: -> { Category.all }, text_attribute: :name)

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  index do
    selectable_column
    id_column
    column :name
    actions defaults: false do |category|
      item 'View', admin_category_path(category), class: 'member_link'
      item 'Edit', edit_admin_category_path(category), class: 'member_link'
    end
  end
end
