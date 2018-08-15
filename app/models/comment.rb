class Comment < ApplicationRecord
  # belongs_to :user
  belongs_to :slide
  validates :content, presence: true
  def from?(some_user)
    user == some_user
  end
  # def broadcast_comment(slide)
  #  ActionCable.server.broadcast("skude_#{chat_room.id}", {
  #     message_partial: ApplicationController.renderer.render(
  #       partial: "messages/message",
  #       locals: { message: self, user_is_messages_author: false }
  #     ),
  #     current_user_id: user.id
  #   })
  # end
end
