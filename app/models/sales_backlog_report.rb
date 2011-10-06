class SalesBacklogReport < ApplicationModel
  belongs_to :report_status
end
# == Schema Information
#
# Table name: sales_backlog_reports
#
#  id               :integer(4)      not null, primary key
#  due_date         :date
#  report_status_id :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#  creator_id       :integer(4)
#  updater_id       :integer(4)
#

