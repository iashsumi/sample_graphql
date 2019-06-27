module Common
  extend ActiveSupport::Concern

  private

  # emails_attributes -> Types::EmailsAttributes(not Hash class)
  def create_user_params(params)
    user_params = {}
    params.each do |key, value|
      if key == :emails_attributes
        data = value.map(&:to_h)
        user_params.store(key, data)
      else
        user_params.store(key, value)
      end
    end
    user_params
  end

  def create_response(user)
    if user.errors.blank?
      {
        message: 'ok',
        errors: []
      }
    else
      {
        message: 'ng',
        errors: user.errors.full_messages
      }
    end
  end
end
