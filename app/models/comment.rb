class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :slide

  def from?(some_user)
    user == some_user
  end
  def broadcast_message
    ActionCable.server.broadcast("slide_#{slide.id}", {
      comment_partial: ApplicationController.renderer.render(
        partial: "comments/comment",
        locals: { comment: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end
end
