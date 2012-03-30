class TestDescriptionsController < ApplicationController
  # GET /test_descriptions
  # GET /test_descriptions.json
  def index
    @test_descriptions = TestDescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_descriptions }
    end
  end

  # GET /test_descriptions/1
  # GET /test_descriptions/1.json
  def show
    @test_description = TestDescription.find(params[:id])
    @test_run = TestRun.find_all_by_test_description_id(@test_description.id).last

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: { test_description: @test_description, test_run: @test_run } }
    end
  end

  # GET /test_descriptions/new
  # GET /test_descriptions/new.json
  def new
    @test_description = TestDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_description }
    end
  end

  # GET /test_descriptions/1/edit
  def edit
    @test_description = TestDescription.find(params[:id])
  end

  # POST /test_descriptions
  # POST /test_descriptions.json
  def create
    @test_description = TestDescription.new(params[:test_description])

    respond_to do |format|
      if @test_description.save
        format.html { redirect_to @test_description, notice: 'Test description was successfully created.' }
        format.json { render json: @test_description, status: :created, location: @test_description }
      else
        format.html { render action: "new" }
        format.json { render json: @test_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_descriptions/1
  # PUT /test_descriptions/1.json
  def update
    @test_description = TestDescription.find(params[:id])

    respond_to do |format|
      if @test_description.update_attributes(params[:test_description])
        format.html { redirect_to @test_description, notice: 'Test description was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_descriptions/1
  # DELETE /test_descriptions/1.json
  def destroy
    @test_description = TestDescription.find(params[:id])
    @test_description.destroy

    respond_to do |format|
      format.html { redirect_to test_descriptions_url }
      format.json { head :no_content }
    end
  end
end
