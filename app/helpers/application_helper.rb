module ApplicationHelper
  def flash_messages(messages=[])
    flash.each do |_, message|
      messages << message
    end
    messages.join("")
  end
end
