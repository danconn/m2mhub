class M2m::Item < M2m::Base
  set_table_name 'inmast'
  has_many :vendors, :class_name => 'M2m::InventoryVendor', :foreign_key => :fpartno, :primary_key => :fpartno
  
  named_scope :part_number_like, lambda { |text|
    {
      :joins => :vendors,
      :conditions => [ 'inmast.fpartno like ? OR invend.fvpartno like ?', '%' + text.strip + '%', '%' + text.strip + '%']
    }
  }
  
end
# == Schema Information
#
# Table name: inmast
#
#  fpartno          :string(25)      not null
#  frev             :string(3)       not null
#  fcstscode        :string(1)       not null
#  fdescript        :string(35)      default(" "), not null
#  flchgpnd         :boolean         not null
#  fmeasure         :string(3)       not null
#  fsource          :string(1)       not null
#  fonhand          :decimal(15, 5)  not null
#  fleadtime        :decimal(7, 1)   not null
#  fprice           :decimal(17, 5)  not null
#  fstdcost         :decimal(17, 5)  not null
#  f2totcost        :decimal(17, 5)  not null
#  flastcost        :decimal(17, 5)  not null
#  flocate1         :string(14)      not null
#  fbin1            :string(14)      not null
#  f2costcode       :string(1)       not null
#  f2displcst       :decimal(17, 5)  not null
#  f2dispmcst       :decimal(17, 5)  not null
#  f2dispocst       :decimal(17, 5)  not null
#  f2disptcst       :decimal(17, 5)  not null
#  f2labcost        :decimal(17, 5)  not null
#  f2matlcost       :decimal(17, 5)  not null
#  f2ovhdcost       :decimal(17, 5)  not null
#  favgcost         :decimal(17, 5)  not null
#  fbook            :decimal(15, 5)  not null
#  fbulkissue       :string(1)       not null
#  fbuyer           :string(3)       not null
#  fcalc_lead       :string(1)       not null
#  fcbackflsh       :string(1)       not null
#  fcnts            :integer         not null
#  fcopymemo        :string(1)       not null
#  fcostcode        :string(1)       not null
#  fcpurchase       :string(1)       not null
#  fcstperinv       :decimal(13, 9)  not null
#  fdisplcost       :decimal(17, 5)  not null
#  fdispmcost       :decimal(17, 5)  not null
#  fdispocost       :decimal(17, 5)  not null
#  fdispprice       :decimal(17, 5)  not null
#  fdisptcost       :decimal(17, 5)  not null
#  fdrawno          :string(25)      not null
#  fdrawsize        :string(2)       not null
#  fendqty1         :decimal(15, 5)  not null
#  fendqty10        :decimal(17, 5)  not null
#  fendqty11        :decimal(17, 5)  not null
#  fendqty12        :decimal(17, 5)  not null
#  fendqty2         :decimal(17, 5)  not null
#  fendqty3         :decimal(17, 5)  not null
#  fendqty4         :decimal(17, 5)  not null
#  fendqty5         :decimal(17, 5)  not null
#  fendqty6         :decimal(17, 5)  not null
#  fendqty7         :decimal(17, 5)  not null
#  fendqty8         :decimal(17, 5)  not null
#  fendqty9         :decimal(17, 5)  not null
#  fgroup           :string(6)       not null
#  finspect         :string(1)       not null
#  flabcost         :decimal(17, 5)  not null
#  flasteoc         :string(25)      not null
#  flastiss         :datetime        not null
#  flastrcpt        :datetime        not null
#  flct             :datetime        not null
#  fllotreqd        :boolean         not null
#  fmatlcost        :decimal(17, 5)  not null
#  fmeasure2        :string(3)       not null
#  fmtdiss          :decimal(15, 5)  not null
#  fmtdrcpt         :decimal(15, 5)  not null
#  fnweight         :decimal(10, 3)  not null
#  fonorder         :decimal(15, 5)  not null
#  fovhdcost        :decimal(17, 5)  not null
#  fprodcl          :string(2)       not null
#  fproqty          :decimal(15, 5)  not null
#  fqtyinspec       :decimal(15, 5)  not null
#  freordqty        :decimal(15, 5)  not null
#  frevdt           :datetime        not null
#  frolledup        :string(1)       not null
#  fsafety          :decimal(15, 5)  not null
#  fschecode        :string(6)       not null
#  fuprodtime       :decimal(9, 3)   not null
#  fyield           :decimal(8, 3)   not null
#  fytdiss          :decimal(15, 5)  not null
#  fytdrcpt         :decimal(15, 5)  not null
#  fabccode         :string(1)       not null
#  ftaxable         :boolean         not null
#  fcusrchr1        :string(20)      not null
#  fcusrchr2        :string(40)      default(" "), not null
#  fcusrchr3        :string(40)      default(" "), not null
#  fnusrqty1        :decimal(15, 5)  not null
#  fnusrcur1        :decimal(17, 5)  not null
#  fdusrdate1       :datetime        not null
#  fcdncfile        :string(80)      default(" "), not null
#  fccadfile1       :string(250)     not null
#  fccadfile2       :string(250)     not null
#  fccadfile3       :string(250)     not null
#  fclotext         :string(1)       not null
#  flexpreqd        :boolean         not null
#  fdlastpc         :datetime        not null
#  fschedtype       :string(1)       not null
#  fldctracke       :boolean         not null
#  fddcrefdat       :datetime        not null
#  fndctax          :decimal(17, 5)  not null
#  fndcduty         :decimal(17, 5)  not null
#  fndcfreigh       :decimal(17, 5)  not null
#  fndcmisc         :decimal(17, 5)  not null
#  fcratedisc       :string(1)       not null
#  flconstrnt       :boolean         not null
#  flistaxabl       :boolean         not null
#  fcjrdict         :string(10)      not null
#  flaplpart        :boolean         not null
#  flfanpart        :boolean         not null
#  fnfanaglvl       :integer         not null
#  fcplnclass       :string(1)       not null
#  fcclass          :string(12)      not null
#  fidims           :integer(4)      not null
#  timestamp_column :binary
#  identity_column  :integer(4)      not null, primary key
#  fcomment         :text            default(" "), not null
#  fgimage          :binary          default("0x"), not null
#  fmusrmemo1       :text            default(" "), not null
#  fstdmemo         :text            default(" "), not null
#  fac              :string(20)
#  sfac             :string(20)
#  itcfixed         :decimal(17, 5)
#  itcunit          :decimal(17, 5)
#  fnPOnHand        :decimal(16, 5)  default(0.0), not null
#  fnLndToMfg       :decimal(16, 5)  default(0.0), not null
#  fcudrev          :string(3)       default(" "), not null
#  fluseudrev       :boolean         default(FALSE), not null
#  fndbrmod         :integer         default(0), not null
#  fiPcsOnHd        :integer(4)      default(0), not null
#  flSendSLX        :boolean         not null
#  fcSLXProd        :string(12)      not null
#  flFSRtn          :boolean         not null
#  fnonnetqty       :decimal(15, 5)  default(0.0), not null
#  fnlatefact       :decimal(4, 2)   not null
#  fnsobuf          :integer         not null
#  fnpurbuf         :integer         not null
#  flcnstrpur       :boolean         not null
#  fdvenfence       :datetime        not null
#  flLatefact       :boolean         not null
#  flSOBuf          :boolean         not null
#  flPurBuf         :boolean         not null
#  flHoldStoc       :boolean         not null
#  fnHoldStoc       :decimal(4, 2)   not null
#  ManualPlan       :boolean         not null
#

