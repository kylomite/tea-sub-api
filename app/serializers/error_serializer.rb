class ErrorSerializer
  def self.serialize_error(message, status_code)
    {
      status: status_code,
      message: message
    }
  end
end
