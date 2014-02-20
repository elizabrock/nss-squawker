ActiveAdmin.register User do
  actions :all, except: :destroy
  controller do
    def permitted_params
      params.permit!
    end

    def resource
      User.where(username: params[:id]).first!
    end
  end
end
