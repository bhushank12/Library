class CsvImportsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @csv_import = CsvImport.new
  end

  def create
    @csv_import = CsvFile.new(csv_file_params) do |t|
      if params[:csv_file][:data]
        t.data = params[:csv_file].read
        t.filename = params[:csv_file][:data].original_filename
        t.mime_type = params[:csv_file][:data].content_type
      end
    end

    if @csv_import.save
      CreateLibrariesJob.perform_now(@csv_import.id)
      flash[:success] = 'File Imported Successfully'
      redirect_to libraries_path
    else
      render 'new'
    end
  end

  def destroy
    @csv_import = CsvImport.find(params[:id])
    @csv_import.destroy
    redirect_to csv_imports_path
  end
end
