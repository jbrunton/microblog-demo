class BleatsController < ApplicationController
  load_and_authorize_resource :except => [:create]

  def new
    @bleat = current_user.bleats.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bleat }
    end
  end

  def create
    @bleat = current_user.bleats.build(params[:bleat])
    authorize! :create, @bleat
    respond_to do |format|
      if @bleat.save
        format.html { redirect_to current_user }
        format.json { render json: @bleat, status: :created, location: @bleat }
      else
        format.html { render action: "new" }
        format.json { render json: @bleat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bleat = Bleat.find(params[:id])
    @user = @bleat.user
    @bleat.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.json { head :no_content }
    end
  end    
end

