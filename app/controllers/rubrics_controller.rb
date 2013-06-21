class RubricsController < ApplicationController
  # GET /rubrics
  # GET /rubrics.json
  def index
    @rubrics_given = Rubric.assigned_rubrics_for(current_user)
    @rubrics_received = current_user.rubrics_received

    @templates = Rubric.templates_for(current_user)
    @can_create = current_user.teacher?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rubrics }
    end
  end

  # GET /rubrics/1
  # GET /rubrics/1.json
  def show
    @rubric = Rubric.find(params[:id])
    @rubric_line_items = @rubric.rubric_line_items

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rubric }
    end
  end

  # GET /rubrics/new
  # GET /rubrics/new.json
  def new
    @rubric = Rubric.new
    @users = Student.all
    @template = params[:template]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rubric }
    end
  end

  # GET /rubrics/1/edit
  def edit
    @rubric = Rubric.find(params[:id])
    @users = Student.all
    @rubric_line_items = @rubric.rubric_line_items
  end

  # POST /rubrics
  # POST /rubrics.json
  def create
    @rubric = Rubric.create!(params[:rubric].merge(:teacher_id => current_user.id))
    @rubric_line_items = []

    respond_to do |format|
      if @rubric.save && @rubric_line_items.each(&:save)
        format.html { redirect_to :rubrics, notice: 'Rubric was successfully created.' }
        format.json { render json: @rubric, status: :created, location: @rubric }
      else
        format.html { render action: "new" }
        format.json { render json: @rubric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rubrics/1
  # PUT /rubrics/1.json
  def update
    @rubric = Rubric.find(params[:id])

    respond_to do |format|
      if @rubric.update_attributes(params[:rubric])
        format.html { redirect_to @rubric, notice: 'Rubric was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rubric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubrics/1
  # DELETE /rubrics/1.json
  def destroy
    @rubric = Rubric.find(params[:id])
    @rubric.destroy

    respond_to do |format|
      format.html { redirect_to rubrics_url }
      format.json { head :no_content }
    end
  end
end
