Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV["AUTH0_CLIENT_ID"],
    ENV["AUTH0_SECRET"],
    ENV["AUTH0_DOMAIN"],
    callback_path: "/auth/oauth2/callback",
    authorize_params: {
      scope: 'openid profile',
      audience: 'https://thensj.auth0.com/userinfo'
    }
  )
end