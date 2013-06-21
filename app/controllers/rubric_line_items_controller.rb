class RubricLineItemsController < ApplicationController
  # GET /rubric_line_items
  # GET /rubric_line_items.json
  def index
    @rubric_line_items = RubricLineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rubric_line_items }
    end
  end

  # GET /rubric_line_items/1
  # GET /rubric_line_items/1.json
  def show
    @rubric_line_item = RubricLineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rubric_line_item }
    end
  end

  # GET /rubric_line_items/new
  # GET /rubric_line_items/new.json
  def new
    @rubric_line_item = RubricLineItem.new
    @rubric_id = params[:rubric_id].to_i
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rubric_line_item }
    end
  end

  # GET /rubric_line_items/1/edit
  def edit
    @rubric_line_item = RubricLineItem.find(params[:id])
    @rubric_id = @rubric_line_item.rubric_id
  end

  # POST /rubric_line_items
  # POST /rubric_line_items.json
  def create
    @rubric_line_item = RubricLineItem.new(params[:rubric_line_item])

    respond_to do |format|
      if @rubric_line_item.save
        format.html { redirect_to edit_rubric_path(@rubric_line_item.rubric), notice: 'Rubric line item was successfully created.' }
        format.json { render json: @rubric_line_item, status: :created, location: @rubric_line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @rubric_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rubric_line_items/1
  # PUT /rubric_line_items/1.json
  def update
    @rubric_line_item = RubricLineItem.find(params[:id])

    respond_to do |format|
      if @rubric_line_item.update_attributes(params[:rubric_line_item])
        format.html { redirect_to edit_rubric_path(@rubric_line_item.rubric), notice: 'Rubric line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rubric_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubric_line_items/1
  # DELETE /rubric_line_items/1.json
  def destroy
    @rubric_line_item = RubricLineItem.find(params[:id])
    @rubric_line_item.destroy

    respond_to do |format|
      format.html { redirect_to rubric_line_items_url }
      format.json { head :no_content }
    end
  end
end
