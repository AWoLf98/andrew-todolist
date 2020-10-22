class ListsController < ApplicationController

  def edit
    @todo = Todo.find(params[:todo_id])
    @list = @todo.lists.find(params[:id])
  end

  def create
    @todo = Todo.find(params[:todo_id])
    @list = @todo.lists.create(list_params)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:todo_id])
    @list = @todo.lists.find(params[:id])
    @list.destroy
    redirect_to todos_path
  end

  def update
    @todo = Todo.find(params[:todo_id])
    @list = @todo.lists.find(params[:id])

    if @list.update(list_params)
      redirect_to todos_path
    else
      render 'edit'
    end
  end

  def complete
    @todo = Todo.find(params[:todo_id])
    @list = @todo.lists.find(params[:id])
    @list.update_attribute(:completed_ad, Time.now)
    redirect_to root_path
  end

  def up
    @todo = Todo.find(params[:todo_id])
    @list = @todo.lists.find(params[:id])
    prev_var = @list.priority
    @list.update_attribute(:priority, prev_var - 1)
    redirect_to root_path
  end

  def down
    @todo = Todo.find(params[:todo_id])
    @list = @todo.lists.find(params[:id])
    prev_var = @list.priority
    @list.update_attribute(:priority, prev_var + 1)
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:item, :priority, :dline)
  end
end
