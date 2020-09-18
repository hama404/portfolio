class CustomFailure < Devise::FailureApp
  def redirect_url
    home_index_url
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
