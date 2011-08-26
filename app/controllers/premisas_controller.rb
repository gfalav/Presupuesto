class PremisasController < ApplicationController
  # GET /premisas
  # GET /premisas.xml
  def index
    @premisas = Premisa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @premisas }
    end
  end

  # GET /premisas/1
  # GET /premisas/1.xml
  def show
    @premisa = Premisa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @premisa }
    end
  end

  # GET /premisas/new
  # GET /premisas/new.xml
  def new
    @premisa = Premisa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @premisa }
    end
  end

  # GET /premisas/1/edit
  def edit
    @premisa = Premisa.find(params[:id])
  end

  # POST /premisas
  # POST /premisas.xml
  def create
    @premisa = Premisa.new(params[:premisa])

    respond_to do |format|
      if @premisa.save
        format.html { redirect_to(@premisa, :notice => 'Premisa was successfully created.') }
        format.xml  { render :xml => @premisa, :status => :created, :location => @premisa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @premisa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /premisas/1
  # PUT /premisas/1.xml
  def update
    @premisa = Premisa.find(params[:id])

    respond_to do |format|
      if @premisa.update_attributes(params[:premisa])
        format.html { redirect_to(@premisa, :notice => 'Premisa was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @premisa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /premisas/1
  # DELETE /premisas/1.xml
  def destroy
    @premisa = Premisa.find(params[:id])
    @premisa.destroy

    respond_to do |format|
      format.html { redirect_to(premisas_url) }
      format.xml  { head :ok }
    end
  end
end
