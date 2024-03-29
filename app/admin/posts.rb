ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :published, :name, :slug, :description, :keywords, :published_date, :content, :social_image, category_ids: []

  controller do
    helper ActionText::Engine.helpers

    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  index do
    selectable_column
    id_column
    column :published, class: 'max-width-30-px'
    column :name
    actions defaults: false do |post|
      item 'View', admin_post_path(post), class: 'member_link'
      item 'Edit', edit_admin_post_path(post), class: 'member_link'
    end
  end

  show do
    attributes_table do
      row :name
      row :slug
      row :description
      row :categories
      row :keywords
      row :published_date
      row :published
      row 'Preview' do
        link_to 'View Post', post_path(post), class: 'member_link'
      end
      row :social_image do
        post.social_image.present? ? image_tag(post.social_image.variant(resize_to_limit: [200, 200])) : content_tag(:span, 'No image yet')
      end
    end

    if post.content.present?
      panel 'Content' do
        raw post.content
      end
    else
      panel 'Content' do
        'No content'
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      input :published, as: :select, include_blank: false
      input :name
      input :slug
      input :published_date, as: :datepicker
      input :description, input_html: { rows: '3' }
      f.input :categories, as: :searchable_select, ajax: { resource: Category }
      input :keywords
      f.input :social_image, as: :file, hint: f.object.social_image.present? ? image_tag(f.object.social_image.variant(resize_to_limit: [200, 200])) : content_tag(:span, 'No image yet')
    end

    f.panel 'Content' do
      f.rich_text_area :content
    end

    br
    br

    f.actions
  end
end
