class M2m::ReceiverItem < M2m::Base
  set_table_name 'rcitem'
  belongs_to :receiver, :class_name => 'M2m::Receiver', :foreign_key => :freceiver, :primary_key => :freceiver
  belongs_to :item, :class_name => 'M2m::Item', :foreign_key => :fpartno, :primary_key => :fpartno  
  
  alias_attribute :quantity, :fqtyrecv
  alias_attribute :receiver_number, :freceiver
  alias_attribute :purchase_order_item_number, :fpoitemno
  alias_attribute :release_number, :frelsno
end
# == Schema Information
#
# Table name: rcitem
#
#  fitemno          :string(3)       not null
#  fpartno          :string(25)      not null
#  fpartrev         :string(3)       not null
#  finvcost         :decimal(17, 5)  not null
#  fcategory        :string(8)       not null
#  fcstatus         :string(1)       not null
#  fiqtyinv         :decimal(15, 5)  not null
#  fjokey           :string(10)      not null
#  fsokey           :string(6)       not null
#  fsoitem          :string(3)       not null
#  fsorelsno        :string(3)       not null
#  fvqtyrecv        :decimal(15, 5)  not null
#  fqtyrecv         :decimal(15, 5)  not null
#  freceiver        :string(6)       not null
#  frelsno          :string(3)       not null
#  fvendno          :string(6)       not null
#  fbinno           :string(14)      not null
#  fexpdate         :datetime        not null
#  finspect         :string(1)       not null
#  finvqty          :decimal(15, 5)  not null
#  flocation        :string(14)      not null
#  flot             :string(20)      not null
#  fmeasure         :string(3)       not null
#  fpoitemno        :string(3)       not null
#  fretcredit       :string(1)       not null
#  ftype            :string(1)       not null
#  fumvori          :string(1)       not null
#  fqtyinsp         :decimal(15, 5)  not null
#  fauthorize       :string(20)      not null
#  fucost           :decimal(17, 5)  not null
#  fllotreqd        :boolean         not null
#  flexpreqd        :boolean         not null
#  fctojoblot       :string(20)      not null
#  fdiscount        :decimal(5, 1)   not null
#  fueurocost       :decimal(17, 5)  not null
#  futxncost        :decimal(17, 5)  not null
#  fucostonly       :decimal(17, 5)  not null
#  futxncston       :decimal(17, 5)  not null
#  fueurcston       :decimal(17, 5)  not null
#  flconvovrd       :boolean         not null
#  timestamp_column :binary
#  identity_column  :integer(4)      not null, primary key
#  fcomments        :text            default(" "), not null
#  fdescript        :text            default(" "), not null
#  FCORIGUM         :string(3)       default(" "), not null
#  fcudrev          :string(3)       default(" "), not null
#  FNORIGQTY        :decimal(18, 5)  default(0.0), not null
#  fac              :string(20)      not null
#  sfac             :string(20)      not null
#  Iso              :string(10)      default(""), not null
#  Ship_Link        :integer(4)      default(0), not null
#  ShsrceLink       :integer(4)      default(0), not null
#
