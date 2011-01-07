class IllustrationsController < ApplicationController
  
  before_filter :confirm_logged_in
  
  # GET /illustrations
  # GET /illustrations.xml
  def index
    @illustrations = Illustration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @illustrations }
    end
  end

  # GET /illustrations/1
  # GET /illustrations/1.xml
  def show
    @illustration = Illustration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @illustration }
    end
  end

  # GET /illustrations/new
  # GET /illustrations/new.xml
  def new
    @illustration = Illustration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @illustration }
    end
  end

  # GET /illustrations/1/edit
  def edit
    @illustration = Illustration.find(params[:id])
  end

  # POST /illustrations
  # POST /illustrations.xml
  def create
    @illustration = Illustration.new(params[:illustration])

    respond_to do |format|
      if @illustration.save
        format.html { redirect_to(@illustration, :notice => 'Illustration was successfully created.') }
        format.xml  { render :xml => @illustration, :status => :created, :location => @illustration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @illustration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /illustrations/1
  # PUT /illustrations/1.xml
  def update
    @illustration = Illustration.find(params[:id])

    respond_to do |format|
      if @illustration.update_attributes(params[:illustration])
        format.html { redirect_to(@illustration, :notice => 'Illustration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @illustration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /illustrations/1
  # DELETE /illustrations/1.xml
  def destroy
    @illustration = Illustration.find(params[:id])
    @illustration.destroy

    respond_to do |format|
      format.html { redirect_to(illustrations_url) }
      format.xml  { head :ok }
    end
  end
end
