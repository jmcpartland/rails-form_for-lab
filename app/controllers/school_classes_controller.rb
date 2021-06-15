class SchoolClassesController < ApplicationController
    
    before_action :set_student_class, only: [:show]

    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(school_classes_params)
        # @school_class = SchoolClass.create(title: params[:title], room_number: params[:room_number])
        redirect_to @school_class
    end

    def show
        @school_class = SchoolClass.find(params[:id])
    end

    def edit
        @school_class = SchoolClass.find(params[:id])
    end

    def update
        @school_class = SchoolClass.find(params[:id])
        @school_class.update(school_classes_params)
        redirect_to school_class_path(@school_class)
    end

    private

    def set_student_class
        @student_class = SchoolClass.find(params[:id])
    end

    def school_classes_params
        params.require(:school_class).permit(:title, :room_number)
    end
end