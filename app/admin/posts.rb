ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :published, :name, :slug, :description, :keywords, :published_date, :content

  controller do
    helper ActionText::Engine.helpers

    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  index do
    selectable_column
    id_column
    column :name
    actions defaults: false do |post|
      item 'View', post_path(post), class: 'member_link'
      item 'Edit', edit_admin_post_path(post), class: 'member_link'
    end
  end

  form do |f|
    f.inputs do
      input :published, as: :boolean
      input :name
      input :slug
      input :published_date, as: :datepicker
      input :description, input_html: { rows: '3' }
      input :keywords
    end
    f.rich_text_area :content
    br

    f.actions
  end
end
