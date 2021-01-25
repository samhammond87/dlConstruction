class TimesheetsController < ApplicationController

    def index
        @timesheets = Timesheet.all
        render json: @timesheets
    end
end

# We don't have views in API mode so we render json instead