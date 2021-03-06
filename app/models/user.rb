class User < ApplicationRecord
    has_many :user_playlists, foreign_key: 'listener_id'
    has_many :creator_playlists, class_name: 'Playlist', foreign_key: 'creator_id'
    has_many :playlists, through: :user_playlists
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :password, presence:true, confirmation:true
end
