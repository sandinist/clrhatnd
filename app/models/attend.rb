class Attend < ActiveRecord::Base
  validates :name, :presence => true
  validates :be_lightning, :be_party,  :inclusion => { :in => [true,  false] }
  validates :mail, :uniqueness => true,
                    :length => { :maximum => 50 },
                    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
end
