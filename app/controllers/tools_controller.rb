class ToolsController < ApplicationController

  def index
    @all = Tool.all
  end

  def new
    @new = Tool.new
  end

  def create
    tool = Tool.create(tool_params)
    if tool.valid?
      redirect_to tool_path(tool)
    else
      flash[:errors] = tool.errors.full_messages
      redirect_to new_tool_path
    end
  end

  private

  def get_instance
    @instance = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name,:category_id)
  end

end
