class PermissionsController < ApplicationController
  authorize_resource

  def create
    member = Member.find(params[:member_id])

    # Reset permissions
    Permission.destroy_all(member_id: member.id)

    # Create new permissions
    params[:permissions].each do |controller, actions|
      actions.each do |action, value|
        member.permissions.create action: action, controller: controller.camelize, created_by: @current_member.id
      end
    end

    redirect_to members_path
  end

end