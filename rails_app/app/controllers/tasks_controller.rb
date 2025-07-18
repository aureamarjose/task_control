# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.includes(collaborator: :sector).all
    @collaborators_hash = Collaborator.unscoped.where(id: @tasks.map(&:collaborator_id)).index_by(&:id)
    @sectors_hash = Sector.unscoped.where(id: @collaborators_hash.values.map(&:sector_id)).index_by(&:id)
    @pagy, @tasks = pagy(@tasks, items: @tasks.count == 5 ? 6 : 5)
  end

  def search
    name_query = params[:search_name]
    status_query = params[:search_status]
    @tasks = FilterTask.call(name_query, status_query)

    @collaborators_hash = Collaborator.unscoped.where(id: @tasks.map(&:collaborator_id)).index_by(&:id)
    @sectors_hash = Sector.unscoped.where(id: @collaborators_hash.values.map(&:sector_id)).index_by(&:id)

    @pagy, @tasks = pagy(@tasks, items: @tasks.count == 5 ? 6 : 5)
    # puts "------------------tasks after pagy: #{@tasks.count}"
    # puts "------------------pagy: #{@pagy.inspect}"
    render(:index)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    result = Tasks::Organizers::CreateAndNotify.call(params: task_params)
    respond_to do |format|
      if result.success?
        format.html { redirect_to(result.task, notice: "Task was successfully created.") }
        format.json { render(:show, status: :created, location: result.task) }
      else
        @task = result.task
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @task.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to(@task, notice: "Task was successfully updated.") }
        format.json { render(:show, status: :ok, location: @task) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @task.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to(tasks_path, status: :see_other, notice: "Task was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.expect(task: [:description, :start_date, :end_date, :due_date, :task_status, :collaborator_id])
  end
end
