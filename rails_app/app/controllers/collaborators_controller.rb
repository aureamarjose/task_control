# frozen_string_literal: true

class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]

  # GET /collaborators or /collaborators.json
  def index
    @collaborators = Collaborator.includes(:sector).all
    @sectors_hash = Sector.unscoped.where(id: @collaborators.map(&:sector_id)).index_by(&:id)
    @pagy, @collaborators = pagy(@collaborators, items: 5)
  end

  def search
    query = params[:query_name]
    @collaborators = Collaborator.search(query).limit(5)
    render(json: @collaborators)
  end

  # GET /collaborators/1 or /collaborators/1.json
  def show
  end

  # GET /collaborators/new
  def new
    @collaborator = Collaborator.new
  end

  # GET /collaborators/1/edit
  def edit
  end

  # POST /collaborators or /collaborators.json
  def create
    @collaborator = Collaborator.new(collaborator_params)

    respond_to do |format|
      if @collaborator.save
        format.html { redirect_to(@collaborator, notice: "Collaborator was successfully created.") }
        format.json { render(:show, status: :created, location: @collaborator) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @collaborator.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /collaborators/1 or /collaborators/1.json
  def update
    respond_to do |format|
      if @collaborator.update(collaborator_params)
        format.html { redirect_to(@collaborator, notice: "Collaborator was successfully updated.") }
        format.json { render(:show, status: :ok, location: @collaborator) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @collaborator.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /collaborators/1 or /collaborators/1.json
  def destroy
    # @collaborator.destroy!
    @collaborator.update!(enabled: false)

    respond_to do |format|
      format.html { redirect_to(collaborators_path, status: :see_other, notice: "Collaborator was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collaborator
    @collaborator = Collaborator.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def collaborator_params
    params.expect(collaborator: [:name, :email, :sector_id])
  end
end
