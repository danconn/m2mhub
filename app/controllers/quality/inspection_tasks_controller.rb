class Quality::InspectionTasksController < M2mhubController
  filter_access_to_defaults

  def index
    @search = Quality::InspectionTask.new(params[:search])
    unless params.member?(:search)
      @search.status = Quality::InspectionTaskStatus.all_open
    end
    s = Quality::InspectionTask
    if @search.status
      s = s.status(@search.status)
    end
    if @search.task_type
      s = s.task_type(@search.task_type)
    end

    @tasks = s.paginate(:page => params[:page], :per_page => 50)
    if M2mhub::Feature.enabled?(:inspection_queue)
      @inspection_items = Production::InspectionItem.all.sort_by { |ip| ip.last_inbound_transaction.time }.reverse
    end
  end

  def new
    @task = build_object
  end

  def edit
    @task = current_object
  end

  def create
    @task = build_object
    if @task.save
      redirect_to inspection_task_url(@task)
    else
      render :action => 'new'
    end
  end

  def update
    @task = current_object
    if @task.update_attributes(params[model_name])
      redirect_to inspection_task_url(@task)
    else
      render :action => 'edit'
    end
  end

  def show
    @task = current_object
  end
  
  def destroy
    @task = current_object
    if task_params = params[model_name]
      @task.delete_lighthouse_ticket = value_to_bool(task_params[:delete_lighthouse_ticket])
    end
    @task.destroy
    respond_to do |format|
      destination = inspection_tasks_url
      format.html {
        flash[:notice] = "Task Deleted"
        redirect_to destination
      }
      format.js {
        render :json => { :location => destination }.to_json
      }
    end
  end

  protected
  
    def model_name
      :quality_inspection_task
    end
  
    def model_class
      Quality::InspectionTask
    end

    def build_object
      @current_object ||= super
      @current_object.status ||= Quality::InspectionTaskStatus.awaiting_receipt
      @current_object.task_type ||= Quality::InspectionTaskType.incoming_inspection
      @current_object
    end
end
