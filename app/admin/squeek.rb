ActiveAdmin.register Squeek do
  controller do
    def permitted_params
      params.permit!
    end

    def scoped_collection
      Squeek.unscoped
    end
  end
end
