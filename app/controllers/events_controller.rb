class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
  
  #
  #CALLERS#######
  #
  def remove_caller
    @event = Event.find(params[:id])
    @caller = @event.callers.find(params[:caller_id])
    
    @event.callers.delete(@caller)
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Caller removed.') }
        format.json { head :ok }
      else
        format.html { render :action => "show" }
        #finish this if json needed?
        #format.json  { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  #
  #END#######
  #
  
  #
  #CONTRIBUTION######
  #
  def remove_contribution
    @event = Event.find(params[:id])
    @contribution = @event.contributions.find(params[:contribution_id])
    
    respond_to do |format|
      if @contribution.destroy
        format.html { redirect_to(@event, :notice => 'Contribution destroyed.') }
        format.json { head :ok }
      else
        format.html { render :action => "show" }
        #finish this if json needed?
        #format.json  { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  #
  #END#######
  #
  
  #two forms with same route so they use same function
  #commit parameter makes a difference
  def add_sponsor_or_caller
    @event = Event.find(params[:id])
    
    #to avoid bugs
    if params[:commit] == "Add sponsor" and params[:sponsor_id] != ""
      @sponsor = Sponsor.find(params[:sponsor_id])
      #to avoid even more bugs
      if !(@event.sponsors.include?(@sponsor))
        @event.sponsors.push(@sponsor)
      end
    #to avoid bugs too
    else if params[:commit] == "Add caller" and params[:caller_id] != ""
      @caller = Caller.find(params[:caller_id])
      #to avoid even more bugs
      if !(@event.callers.include?(@caller))
        @event.callers.push(@caller)
      end
    end end
    
    #redirect_to event_path(@event)
    respond_to do |format|
      format.html { redirect_to(event_path(@event)) }
      format.json { head :ok }
    end
  end
  
  def change_sponsor_status
    @event = Event.find(params[:id])
    @sponsor = Sponsor.find(params[:sponsor_id])
    if @sponsor.status == "Y"
      @sponsor.status = "N"
    else
      if @sponsor.status == "N"
        @sponsor.status = "Y"
      else
        @sponsor.status = "N"
      end
    end 
    
    @sponsor.save
    
    respond_to do |format|
      format.html { redirect_to(event_path(@event), :notice => 'Sponsor status updated.') }
      format.json { head :ok }
    end  
  end
end
