class StudentsController < ApplicationController 
	def index 
		if params[:keywords].present?
			@keywords = params[:keywords]
			student_search_term = StudentSearchTerm.new(@keywords)
			@students = Student.where(
				student_search_term.where_clause,
				student_search_term.where_args).
			order(student_search_term.order)
		else
			@students = []
		end
	end 
end