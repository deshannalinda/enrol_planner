class DownloadController < ApplicationController 
  def index
  end
  
  def show
	  
  end

  def pdf
  	
  	require "test"
   

  	#send_file Rails.root.join('private', 'test.pdf'), :type=>"application/pdf", :x_sendfile=>true
  end
  
  include PlannerHelper

  def csv
	  if request.get?()
		  time = Time.now.strftime('%Y%m%d%H%M%S')
		  filename = "Enrolment_" + time
		  
		  send_data export_enrol_planner_csv, :type=> 'text/csv', :disposition => "attachment;filename=#{filename}.csv"
	  elsif request.post?()
		  import_enrol_planner_csv(params[:file])
	  end
  end
end
