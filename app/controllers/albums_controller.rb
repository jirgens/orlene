class AlbumsController < InheritedResources::Base
  actions :new, :show
  before_filter :require_user, except: [:index, :show]


  def index
    album.pictures.order('created_at DESC').limit(4)
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(1)
    @picture = @album.pictures.find_by(:id)
  end

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
