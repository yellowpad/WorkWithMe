class SkillsController < ApplicationController
  def new
		@skill = Skill.new
		@skills = Skill.all
	end

	def show
		@skill = Skill.find(params[:id])
	end

	def create
		@skill = Skill.find_or_create_by(name: skill_params[:name].downcase)
		redirect_to new_skill_path
	end

	def autocomplete
		if params[:term]
			searchterm=params[:term].downcase
		end
		@skills = Skill.order(:name).where("LOWER(name) LIKE ?", "%#{searchterm}%")
		respond_to do |format|
			format.html
			format.json{
				render json: @skills.map(&:name).to_json
			}
		end
	end

	private

	def	skill_params
		params.require(:skill).permit(:name)
	end
end
