class TimesheetsController < ApplicationController
before_action :set_timesheet, only: [:show, :update, :destroy]

# We don't have views in API mode so we render json instead
    def index
        @timesheets = Timesheet.all
        render json: @timesheets
    end

    def create
        @timesheet = Timesheet.create(timesheet_params)
        if @timesheet.errors.any?
            render json: @timesheet.error.any?, status: unprocessable_entity
        else
            render json: @timesheet, status: 201
        end
    end

    def show
        render json: @timesheet
    end

    def update
        @timesheet.update(timesheet_params)
        if @timesheet.errors.any?
            render json: @timesheet.errors, status: unprocessable_entity
        else
            render json: @timesheet, status: 201
        end
    end

    def destroy
        @timesheet.delete
        render json: 204
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

end