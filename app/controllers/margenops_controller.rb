class MargenopsController < ApplicationController
  # GET /margenops
  # GET /margenops.xml
  def index
    @margenops = Margenop.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @margenops }
    end
  end

  # GET /margenops/1
  # GET /margenops/1.xml
  def show
    @margenop = Margenop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @margenop }
    end
  end

  # GET /margenops/new
  # GET /margenops/new.xml
  def new
    @margenop = Margenop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @margenop }
    end
  end

  # GET /margenops/1/edit
  def edit
    @margenop = Margenop.find(params[:id])
  end

  # POST /margenops
  # POST /margenops.xml
  def create
    @margenop = Margenop.new(params[:margenop])

    respond_to do |format|
      if @margenop.save
        format.html { redirect_to(@margenop, :notice => 'Margenop was successfully created.') }
        format.xml  { render :xml => @margenop, :status => :created, :location => @margenop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @margenop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /margenops/1
  # PUT /margenops/1.xml
  def update
    @margenop = Margenop.find(params[:id])

    respond_to do |format|
      if @margenop.update_attributes(params[:margenop])
        format.html { redirect_to(@margenop, :notice => 'Margenop was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @margenop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /margenops/1
  # DELETE /margenops/1.xml
  def destroy
    @margenop = Margenop.find(params[:id])
    @margenop.destroy

    respond_to do |format|
      format.html { redirect_to(margenops_url) }
      format.xml  { head :ok }
    end
  end
end
