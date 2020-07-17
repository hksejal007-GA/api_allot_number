module ExceptionsHandlerHelper
  def render_success(status,message, data)
    render json: {status: status,message: message, phone: data.as_json}
  end
  def render_error(status,message)
    render json: {status: status,message: message}
  end
  def render_object(status,message, data)
    render json: {status: status,message: message, phones: data.as_json}
  end
end
