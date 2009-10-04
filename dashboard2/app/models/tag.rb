class Tag < ActiveRecord::Base
  attr_accessible :tag_name, :value, :enabled, :always_fill, :sample_rate, :tier, :frequency_cap, :rejection_time, :tag, :tag_options_attributes

  belongs_to :network
  belongs_to :publisher
  belongs_to :adformat
  has_many :tag_options

  accepts_nested_attributes_for :tag_options, :allow_destroy => true

   def enabled_s 
      enabled ? "Yes" : "No"
   end

   def always_fill_s 
      always_fill ? "Yes" : "No"
   end


end
