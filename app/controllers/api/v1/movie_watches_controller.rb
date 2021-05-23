class Api::V1::MovieWatchesController < ApplicationController
    def index
        moviewatches = MovieWatch.all 
        render json: moviewatches
    end

end
