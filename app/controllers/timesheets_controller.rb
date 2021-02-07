class TimesheetsController < ApplicationController
before_action :authenticate_user, except: [:show]
before_action :set_timesheet, only: [:show, :update, :destroy]
# before_action :check_ownership, only: [:update, :destroy]


# We don't have views in API mode so we render json instead
 
    def index
        if current_user.admin?
            @timesheets = Timesheet.all
            render json: @timesheets
        else
            @timesheets = Timesheet.where(user_id: current_user.id)
            render json: @timesheets
        end
    end

    def create
        @timesheet = current_user.timesheets.create(timesheet_params)
        if @timesheet.errors.any?
            render json: @timesheet.error.any?, status: unprocessable_entity
        else
            render json: @timesheet, status: 201
        end
    end

    def show
        render json: @timesheet.transform_timesheet
    end

    def update
        @timesheet.update(timesheet_params)
        if @timesheet.errors.any?
            render json: @timesheet.errors, status: unprocessable_entity
        else
            render json: @timesheet, status: 201
        end
    end

    # allow admin to delete timesheets
    def destroy
        if current_user.admin?
         @timesheet.delete
        render json: 204
        end
    end

    

    private
    
    def timesheet_params
        params.require(:timesheet).permit(:name, :date, :start_time, :end_time, :total_hours, :comments)
    end

    def set_timesheet
        begin
            @timesheet = Timesheet.find(params[:id])
        rescue
            render json: {error: "Timesheet not found"}, status: 404
        end
    end

    # def check_ownership
    #     if current_user.id != @timesheet.user.id
    #         render json: {error: "You don't have permission to do that, Sorry!"}, status: 401
    #     end
    # end
end