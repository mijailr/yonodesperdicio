class OrganizationsController < InheritedResources::Base

  private

    def organization_params
      params.require(:organization).permit(:name, :title, :content, :CP, :address, :published_at)
    end
end

