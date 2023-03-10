class Api::V1::SessionsController < Api::V1::BaseController
  # skip verification for login
  skip_before_action :verify_request, only: :login

  def login
    # Recap of what needs to happen in login
    # 1 - Rails sends the code to Tencent along with app secret and app id
    # 2 - Tencent sends back user's openId
    # 3 - Find user with openId in the database; if not, create a new user with this openId
    # 4 - Send a JWT that stores user information to MP

    code = params[:code]
    open_id = fetch_wx_open_id(code)
    @user = User.find_or_create_by(open_id:)
    token = fetch_jwt_token(@user)
    user_info(@user)

    response.set_header('Authorization', token)
  end

  private

  def fetch_wx_open_id(code)
    # 1. - Find the app_id and app_secret in the credentials
    app_id = Rails.application.credentials.dig(:wechat, :app_id)
    app_secret = Rails.application.credentials.dig(:wechat, :app_secret)

    # 2. - Send a request to Tencent API with app_id, app_secret, and the code
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{app_id}&secret=#{app_secret}&js_code=#{code}&grant_type=authorization_code"
    response = RestClient.get(url)
    JSON.parse(response)['openid']
  end

  def fetch_jwt_token(user)
    # 1. - Create a JWT with user's information
    # 2. - set expiration date to 7 days from now
    payload = { user_id: user.id, exp: 7.days.from_now.to_i }
    JWT.encode(payload, HMAC_SECRET, 'HS256')
  end

  def user_info(user)
    user.nickname = '路人甲' if user.nickname.nil?
    user.role = 'audience' if user.role.nil?
    user.save
  end
end
