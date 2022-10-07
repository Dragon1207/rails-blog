class Header2Controller < ApplicationController
    def show
        @header2 = Header2.order("id DESC").first
        render json: @header2
    end
end
