class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
    # GET /task
    # GET /task.json
    def index

      @tasks = Card.where(authorization_id: Authorization.current_id).find(params[:card_id]).tasks
    end

    # GET /task/1
    # GET /task/1.json
    def show
    end

    # GET /task/new
    def new
      @task = Task.new
    end

    # GET /task/1/edit
    def edit
    end

    # POST /task
    # POST /task.json
    def create
      @task = Task.new(task_params)
      @task[:authorization_id] = Authorization.current_id
      respond_to do |format|
        if @task.save
          format.html { redirect_to @task, notice: 'Task was successfully created.' }
          format.json { render :show, status: :created}
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /task/1
    # PATCH/PUT /task/1.json
    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to @task, notice: 'Task was successfully updated.' }
          format.json { render :show, status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /task/1
    # DELETE /task/1.json
    def destroy
      @task.destroy
      respond_to do |format|
        format.html { redirect_to card_task_url, notice: 'Task was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


    class TagsController < ApplicationController
        def tags
            Tag.all
        end
        def tag
            tags.find params[:id]
        end

        def index
            @tags = tags
            # ...
        end
        # ...
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.where(authorization_id: Authorization.current_id).find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def task_params
        taskparam = params[:task]
        taskparam[:card_id] = params[:card_id]
        taskparam.permit(:name, :done, :card_id)
      end

end
