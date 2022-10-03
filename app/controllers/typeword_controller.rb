class TypewordController < ApplicationController
    def show
        @typewords = Typeword.all()
        @words = []
        @typewords.each do |x|
            @words.append(x.typeword)
        end
        render json: @words
    end
end
