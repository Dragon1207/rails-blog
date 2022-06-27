ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :published, :name, :slug, :description, :keywords, :published_date

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end
end
