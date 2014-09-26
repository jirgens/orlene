class AlbumsController < InheritedResources::Base
  actions :index, :new
  before_filter :require_user, except: [:index, :show]

  # def index
  #   @albums = Album.all
  #   @pictures = Album.find_by(:id).pictures.all
  # end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(1)
    @picture = @album.pictures.find_by(:id)
  end

  # def show
  #   @album = Album.find(params[:id])
  #   @album.pictures.limit(4).order("created_by")
  # end


  def create
    @album = Album.new(album_params)
    @album.save!
    if @album.save
      flash[:success] = "You created a new Gallery Category!"
      redirect_to albums_path
    else
      flash[:error] = "There was a problem with your title"
      render :new
    end
  end

  def destroy
    @album = Album.find(album_params)
    @album.destroy
  end


  private
  def album_params
    params.require(:album).permit(:title, :pictures)
  end
end
