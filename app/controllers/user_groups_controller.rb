class UserGroupsController < ApplicationController

  def index
    # service = SlackService.new(current_user)
    user_groups = service.get_user_groups
    create_user_groups(user_groups)
    @user_groups = UserGroup.all
  end

  def show
    @group = service.get_group_info
  end

  private

    def service
      @service ||= SlackService.new(current_user)
    end

    def create_user_groups(user_groups)
      usergroups = user_groups[:usergroups]
      usergroups.each do |usergroup|
        UserGroup.generate_user_group(usergroup)
      end
    end
end
