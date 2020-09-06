require 'pry'
class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize(path = './db/mp3s')
     MusicImporter.new(path).import
     
  end
  
  def call 
    answer = ''
     while answer != 'exit'
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts  "To list all of the songs of a particular genre, enter 'list genre'."
    puts  "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    answer = gets.chomp
   end
 end
 
 def list_songs 
   Song.all.sort_by(&:name).each.with_index(1) do |x,z| 
   puts "#{z}. #{x.artist.name} - #{x.name} - #{x.genre.name}" 
 end
end
 
 def list_artists
   Artist.all.sort_by(&:name).each.with_index(1) do |x,z|
     puts "#{z}. #{x.name}"
   end
 end 
  
  def list_genres
      Genre.all.sort_by(&:name).each.with_index(1) do |x,z| 
       puts "#{z}. #{x.name}"
    end
 end 
 
 def list_songs_by_artist
   puts "Please enter the name of an artist:"
     x = gets.chomp
    
    if  artist = Artist.find_by_name(x)
     artist.songs.sort_by(&:name).each.with_index(1) do |z,x|
      
      puts "#{x}. #{z.name} - #{z.genre.name}"
  end 
end




end





end 