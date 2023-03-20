class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
       t.integer    "friend_id"
       t.references "user"
       t.boolean    "status",default: false
       t.integer    "requester_id"
       t.datetime   "accepted_at"
       
      t.timestamps
    end
  end
end
