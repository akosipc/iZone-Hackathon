class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name,
                  :gender, :username, :avatar_path, :provider, :uid, :role, :group_id, :access_token

  validates_presence_of :first_name, :last_name, :role, :gender, :username
  validates_uniqueness_of :username

  belongs_to :group

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def role?
    self.role
  end

  def is_admin?
    true if self.role? == "Admin"
  end

  def is_user?
    true if self.role? == "User"
  end

  def promote!
    self.update_attributes(:role => 'Admin')
  end

  def has_a_group?
    self.group.present?
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(provider:      auth.provider,
                      uid:           auth.uid,
                      email:         auth.info.email,
                      password:      Devise.friendly_token[0,20],
                      first_name:    auth.extra.raw_info.first_name,
                      last_name:     auth.extra.raw_info.last_name,
                      gender:        auth.extra.raw_info.gender.capitalize!,
                      username:      auth.info.nickname,
                      avatar_path:   auth.info.image.gsub('type=square','width=400&height=400'),
                      access_token:  auth['credentials']['token'],
                      role:          'User')
      user.save
    end
    user
  end

  def self.new_with_sessions(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
