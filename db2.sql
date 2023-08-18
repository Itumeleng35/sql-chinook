select * from genres;
select * from playlists;
select * from playlists where name like '%S';
select * from artists where name = 'Lost';
select * from albums where artistID = 149;

select * from artists 
join albums on artists.ArtistsId = albums.ArtistId 
where name = 'U2';

select AlbumId,Title from artists 
join albums on artists.ArtistId = albums.ArtistId 
where artists.ArtistId = 1;

select AlbumId,Title from artists 
join albums on artists.ArtistId = albums.ArtistId 
where artists.ArtistId = 1;

select name, AlbumId,Title from artists 
join albums on artists.ArtistId = albums.ArtistId 
where artists.ArtistId = 17;

select name, AlbumId, Title from artists
join albums on artists.ArtistId = albums.ArtistId
where artists.ArtistId = 50; 

select * from genres
where genres.name = 'Blues';

select * from genres
Join tracks on genres.GenreId = tracks.GenreId
where genres.name = 'Opera';

select * from genres
Join tracks on genres.GenreId = tracks.GenreId
where genres.name = 'Opera';

select * from playlists
where playlist_track on playlist_track.Playlist
where playlists.name = 'Audiobooks'


-- Find all the songs in a playlist - by playlist name
select * from playlists
join playlist_track
on playlist_track.PlaylistId = playlists.PlaylistId
join tracks
on playlist_track.TrackId = tracks.TrackId
where playlists.Name = 'Classical'

-- Find all the artists for a given genre
select
 DISTINCT artists.Name
from genres
join tracks on tracks.GenreId = genres.GenreId
join albums on albums.AlbumId = tracks.AlbumId
join artists on artists.ArtistId = albums.ArtistId
where Genres.Name = 'Rock';

-- Find the Playlist with the most/ least songs
select playlists.Name, count(*) from playlists
join playlist_track
on playlists.PlaylistId = playlist_track.PlaylistId
group by playlists.Name
order by count(*) DESC
limit 1;

-- playlist with least songs
select playlists.Name, count(*) from playlists
join playlist_track
on playlists.PlaylistId = playlist_track.PlaylistId
group by playlists.Name
order by count(*) ASC
limit 1

-- Find the total for a given invoice (will need a sum)
select * from invoices
where invoices.invoiceId = 17

-- Find all playlists containing a genre

-- Find the biggest/smallest invoice amounts
select InvoiceId, Min(Total) from invoices;
select InvoiceId, Max(Total) from invoices;

-- Find the artist with the most/least songs (needs group by)
-- SELECT
-- count(DISTINCT artists.Name)
-- artists.Name
Select
artists.Name, count(*) as TrackCount
from artists
join albums on albums.ArtistId = artists.ArtistId
join tracks on tracks.AlbumId = albums.AlbumId
group by artists.Name
order by TrackCount DESC
LIMIT 5
-- OFFSET 5

-- least songs
-- SELECT
-- count(DISTINCT artists.Name)
-- artists.Name
select
artists.Name, count(*) as Trackcount
from artists
join albums on albums.ArtistId = artists.ArtistId
join tracks on tracks.AlbumId = albums.AlbumId
group by artists.Name
order by TrackCount ASC
LIMIT 5
-- OFFSET 5
