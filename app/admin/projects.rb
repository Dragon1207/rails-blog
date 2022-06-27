ActiveAdmin.register Project do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :slug, :description, :url, :image

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  index do
    selectable_column
    id_column
    column :name
    actions defaults: false do |project|
      item 'View', admin_project_path(project), class: 'member_link'
      item 'Edit', edit_admin_project_path(project), class: 'member_link'
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :slug
      f.input :description
      f.input :url
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image.variant(resize: '200x200')) : content_tag(:span, 'No image yet')
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :slug
      row :description
      row :url
      row :image do
        image_tag(project.image.variant(resize: '200x200'))
      end
    end
  end
end
