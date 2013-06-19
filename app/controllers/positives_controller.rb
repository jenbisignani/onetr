class PositivesController < ApplicationController
  # GET /positives
  # GET /positives.json
  def index
    @positives_given = current_user.positives_given.all.sort_by(&:created_at)
    @positives_received = current_user.positives_received.all.sort_by(&:created_at)
    @can_create = current_user.teacher?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @positives }
    end
  end

  # GET /positives/1
  # GET /positives/1.json
  def show
    @positive = Positive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @positive }
    end
  end

  # GET /positives/new
  # GET /positives/new.json
  def new
    @positive = Positive.new
    @users = Student.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @positive }
    end
  end

  # GET /positives/1/edit
  def edit
    @positive = Positive.find(params[:id])
  end

  # POST /positives
  # POST /positives.json
  def create
    @positive = Positive.new(params[:positive].merge(:teacher_id => current_user.id))

    respond_to do |format|
      if @positive.save
        format.html { redirect_to  :positives, notice: 'Positive was successfully created.' }
        format.json { render json: @positive, status: :created, location: @positive }
      else
        format.html { render action: "new" }
        format.json { render json: @positive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /positives/1
  # PUT /positives/1.json
  def update
    @positive = Positive.find(params[:id])

    respond_to do |format|
      if @positive.update_attributes(params[:positive])
        format.html { redirect_to @positive, notice: 'Positive was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @positive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positives/1
  # DELETE /positives/1.json
  def destroy
    @positive = Positive.find(params[:id])
    @positive.destroy

    respond_to do |format|
      format.html { redirect_to positives_url }
      format.json { head :no_content }
    end
  end
end
