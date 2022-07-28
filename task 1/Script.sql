create table if not exists MusicGenre (
	genre_id SERIAL primary key,
	name varchar(60) not null
);

create table if not exists Artist (
	artist_id SERIAL primary key,
	name varchar(60) not null
);

create table if not exists ArtistGenre (
	artist_id integer references Artist(artist_id),
	genre_id integer references MusicGenre(genre_id),
	constraint pk primary key (artist_id, genre_id)
);


create table if not exists Track (
	track_id SERIAL primary key,
	name varchar(80) not null,
	duration time not null
);


create table if not exists Album (
	album_id SERIAL primary key,
	name varchar(60) not null,
	publication_date date,
	track_id integer references Track(track_id)
);	


create table if not exists ArtistAlbum (
	artist_id integer references Artist(artist_id),
	album_id integer references Album(album_id),
	constraint pk1 primary key (artist_id, album_id)
);

create table if not exists Playlist (
	playlist_id SERIAL primary key,
	name varchar(80) not null,
	duration time not null
);

create table if not exists PlaylistTrack (
	track_id integer references Track(track_id),
	playlist_id integer references Playlist(playlist_id),
	constraint pk2 primary key (track_id, playlist_id)
);