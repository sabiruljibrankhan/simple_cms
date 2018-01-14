class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject =Subject.new({:name => 'Default'})
  end

  def create
    #instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #save the object
    if @subject.save
      #if the save succeeds, redirects to the index action
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      #if the save fails, redisplay the form so user can fix the problem
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #Find a new object using form parameters
    @subject = Subject.find(params[:id])
    #Update the object
    if @subject.update_attributes(subject_params)
      #if the save succeeds, redirects to the show action
      flash[:notice] = "Subject updated successfully"
      redirect_to(subject_path(@subject))
    else
      #if the save fails, redisplay the form so user can fix the problem
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' deleted successfully"
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name,:position,:visible)
  end
end
