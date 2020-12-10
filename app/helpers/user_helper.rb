module UserHelper
  def render_friendship_btn(user)
    return if current_user == user

    add_friendship_param = { friendship: { user_id: current_user, friend_id: user, confirmed: false } }
    delete_param = { id: user.id }
    if !current_user.friend?(user) && !current_user.request_exists?(user)
      link_to 'Add as a Friend', friendships_path(add_friendship_param), method: :post, class: ' btn btn-success'
    elsif !current_user.request_exists?(user)
      link_to 'Unfriend', friendship_path(delete_param), method: :delete, class: ' btn btn-warning'
    elsif current_user.request_to_me?(user)
      link = capture do
        link_to 'Accept Request',
                friendship_path(search_friendship(user.id, current_user.id)),
                method: :put, class: ' btn btn-success'
      end
      link << capture do
        link_to 'Delete Request',
                friendship_path(delete_param), method: :delete, class: ' btn btn-Danger'
      end
    elsif current_user.request_exists?(user)
      link = capture do
        link_to 'Delete Request',
                friendship_path(delete_param), method: :delete, class: ' btn btn-Danger'
      end
    end
  end
end
