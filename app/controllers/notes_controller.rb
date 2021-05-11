class NotesController < ApplicationController
  before_action :login_required
  # before_action :current_user
  # before_action :note, only: %i[ show edit update destroy ]

  # GET /notes
  def index
    @notes = current_user.notes
    @user = current_user
  end

  # GET /notes/1
  def show    
    note
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    note
  end

  # POST /notes 
  def create
    @note = Note.new(title: note_params[:title], body: note_params[:body])
    @note.user_id = current_user.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: "Note was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  def update
    respond_to do |format|
      if note.update(note_params)
        format.html { redirect_to notes_path, notice: "Note was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  def destroy
    note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
    end
  end

  private
  
  def current_user
    User.find(session[:current_user][0]["id"])
  end
  
  def note
    @note = Note.find(params[:id])
    if current_user.id != @note.user_id
      respond_to do |format|
          format.html { redirect_to notes_path, notice: "Unauthorized Access" }
      end
    else
      @note
    end
  end
  
  # Only allow a list of trusted parameters through.
  def note_params
    params.require(:note).permit(:title, :body)
  end
end
