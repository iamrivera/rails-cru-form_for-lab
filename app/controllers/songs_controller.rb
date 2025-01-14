class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    def show
        @song = find_song
        @genre = Genre.find(find_song.genre_id)
        @artist = Artist.find(find_song.artist_id)
    end

    def edit
        @song = find_song
    end

    def update
        @song = find_song
        @song.update(song_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)    
    end

    private 

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    def find_song
        Song.find(params[:id])  
    end
end
