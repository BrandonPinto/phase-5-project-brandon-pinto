class CommunityEvent < ApplicationRecord
belongs_to :user
has_many :participants


# def show_community_participants
#     token = request.headers["token"]
#     user_id = decode_token(token)

#     event = CommunityEvent.find(params[:id])

#     host = CommunityEvent.find(params[:user_id])

#     if 
#         host = user_id
#         all_participants = Participants.all
    
#         render json: all_participants
#     else
#         render json: {error: "you are not the host, sorry!"}, 
#     end
# end
end