class TodosController < ApplicationController
  def create
    @todo= Todo.new(todo_params)
    if @todo.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:item)
    end
end
