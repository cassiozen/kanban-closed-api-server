class CardsController < ApplicationController
    before_action :set_card, only: [:show, :edit, :update, :sort, :destroy]
    # GET /card
    # GET /card.json
    def index
      @cards = Card.where(authorization_id: Authorization.current_id).includes(:tasks).order("position")
      # Create default cards & tasks if empty for this authorization
      if @cards.count == 0 then
        ActiveRecord::Base.transaction do
          tasks = Task.create([{name:"ContactList Example", done:true, authorization_id: Authorization.current_id},{name:"Kanban Example", done:false, authorization_id: Authorization.current_id},{name:"My own experiments", done:false, authorization_id: Authorization.current_id}])
          cards = Card.create([{title: "Read the Book", description: "I should read the **whole** book", color: '#BD8D31', status: "in-progress",authorization_id: Authorization.current_id}, {title: "Write some code", description: "Code along with the samples in the book at [github](https://github.com/pro-react)",color: '#3A7E28',status: "todo",tasks: tasks,authorization_id: Authorization.current_id}])
        end
      end

    end

    # GET /card/1
    # GET /card/1.json
    def show
    end

    # GET /card/new
    def new
      @card = Card.new
    end

    # GET /card/1/edit
    def edit
    end

    # POST /card
    # POST /card.json
    def create
      @card = Card.new(card_params)
      @card[:authorization_id] = Authorization.current_id
      respond_to do |format|
        if @card.save
          format.html { redirect_to @card, notice: 'Card was successfully created.' }
          format.json { render :show, status: :created }
        else
          format.html { render :new }
          format.json { render json: @card.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /card/1
    # PATCH/PUT /card/1.json
    def update
      respond_to do |format|
        if(card_params.has_key?('position') )
          @card.insert_at(card_params['position'])
        end

        if @card.update(card_params.except('position'))
          format.html { redirect_to @card, notice: 'Card was successfully updated.' }
          format.json { render :show, status: :ok, location: @card }
        else
          format.html { render :edit }
          format.json { render json: @card.errors, status: :unprocessable_entity }
        end
      end
    end

    def sort

      respond_to do |format|
        @card.insert_at(card_params['position'])

        format.json { render :show, status: :ok, location: @card }

      end
    end

    # DELETE /card/1
    # DELETE /card/1.json
    def destroy
      @card.destroy
      respond_to do |format|
        format.html { redirect_to card_url, notice: 'Card was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_card
        @card = Card.where(authorization_id: Authorization.current_id).find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def card_params
        params.require(:card).permit(:title, :description, :color, :status, :position)
      end

end
