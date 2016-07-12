module LogragePayload
  extend ActiveSupport::Concern

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    payload[:user_id] = current_user.id if try(:current_user)
  end
end
