class Message < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"
    after_create_commit { broadcast_append_to "messages", locals: {id: self.sender_id}  }

end
