class User < ActiveRecord::Base

  has_many :ads

  has_many :friendships
  has_many :friends, :through => :friendships

  before_save :default_lang

  has_many :legacy_sent_messages, :class_name=> 'Legacy::Message', :foreign_key=>'user_from', :dependent=>:destroy
  has_many :legacy_recieved_messages, :class_name=> 'Legacy::Message', :foreign_key=>'user_to', :dependent=>:destroy

  validates :username,
    uniqueness: true,
    length: { minimum: 3 }

  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  acts_as_messageable

  def name
    username
  end

  def to_s
    username
  end

  def mailboxer_email(object)
    email
  end

  def unread_messages_count
    self.mailbox.inbox.unread(self).count
  end

  def admin?
    role == 1
  end

  #this method is called by devise to check for "active" state of the model
  def active_for_authentication?
    super and self.locked != 1
  end

  def unlock!
    self.update_column('locked', 0)
  end

  def lock!
    self.update_column('locked', 1)
  end

  def default_lang
    self.lang ||= "es"
  end

  def is_friend? user
    self.friends.where(id: user.id).count > 0 ? true : false
  end

end
