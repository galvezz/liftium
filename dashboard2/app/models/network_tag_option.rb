class NetworkTagOption < ActiveRecord::Base
  belongs_to :network

  # FIXME make sure that it is a valid network
  validates_format_of :option_name, :with => /^[A-Za-z0-9]+$/, :message => "can only contain alphanumeric characters (no spaces)"
  validates_uniqueness_of :option_name, :scope => :network_id
  validates_presence_of :option_name, :network_id
  validates_inclusion_of :required, :in => [true, false]
  validates_numericality_of :network_id, :only_integer => true, :greater_than_or_equal_to => 0

  def required_s 
    required ? "Yes" : "No"
  end
end
