class ContributionsController < ApplicationController
  # GET event/event_id/contributions
  # GET event/event_id/contributions.json
  def index
    @event_id = params[:event_id].to_i
    @contributions = Contribution.all.delete_if {|x| x.event_id != @event_id}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contributions }
    end
  end

  # GET event/event_id/contributions/1
  # GET event/event_id/contributions/1.json
  def show
    @event = Event.find(params[:event_id])
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contribution }
    end
  end

  # GET event/event_id/contributions/new
  # GET event/event_id/contributions/new.json
  def new
    @event = Event.find(params[:event_id])
    @contribution = Contribution.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @contribution }
    end
  end

  # GET event/event_id/contributions/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @contribution = Contribution.find(params[:id])
  end

  # POST event/event_id/contributions
  # POST event/event_id/contributions.json
  def create
    @event = Event.find(params[:event_id])
    @contribution = @event.contributions.create(params[:contribution])

    respond_to do |format|
      if @contribution.save
        format.html { redirect_to event_contributions_path(@event.id),notice: 'Contribution was successfully created.' }
        format.json { render json: @contribution, status: :created, location: event_contributions_path(@event.id) }
      else
        format.html { render action: "new" }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT event/event_id/contributions/1
  # PUT event/event_id/contributions/1.json
  def update
    @event = Event.find(params[:event_id])
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      if @contribution.update_attributes(params[:contribution])
        format.html { redirect_to event_contribution_path(@event, @contribution), notice: 'Contribution was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE event/event_id/contributions/1
  # DELETE event/event_id/contributions/1.json
  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy

    respond_to do |format|
      format.html { redirect_to event_contributions_path(params[:event_id]) }
      format.json { head :ok }
    end
  end
  
  def change_status
    @event = Event.find(params[:event_id])
    @contribution = Contribution.find(params[:id])
    
    if @contribution.status == 'N'
      @contribution.status = 'Y'
    else
      @contribution.status = 'N'
    end
    @contribution.save
    
    redirect_to :back
  end
end