class SlackService

  def initialize(user)
    @user = user
    @connection = Faraday.new(:url => 'https://slack.com/api')
  end

  def get_user_groups
    # parse(@connection.get "/usergroups.list", { token: @user.token } )
    parse(Faraday.get("https://slack.com/api/usergroups.list?token=#{@user.token}&pretty=1"))
  end

  def get_slack_users(user_group)
    parse(Faraday.get("https://slack.com/api/usergroups.users.list?token=#{@user.token}&usergroup=#{user_group.team_id}&pretty=1"))
  end

  def get_slack_user_info(id)
    parse(Faraday.get("https://slack.com/api/users.info?token=#{@user.token}&user=#{id}&pretty=1"))
  end

  private

    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end
end
