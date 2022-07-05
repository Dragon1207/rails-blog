ActiveAdmin.register AdminUser do
  permit_params :email, :about_page, :about_page_content

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
    end
    f.inputs do
      f.input :about_page,
              as: :select,
              label: 'Use this user for the about page',
              prompt: false,
              include_blank: false
    end
    f.inputs do
      f.rich_text_area :about_page_content
    end
    f.actions
  end
end
