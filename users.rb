# TODO: finish mapping users

@users = Hash.new

@users["Adrian Gierakowski"]         = 'adrian-gierakowski'
@users["Alexander Refsum Jensenius"] = 'alexarje'
@users["Pascal Baltazar"]            = 'bltzr'

# check ~> @users[""]            = 'blueyeti'
@users["Pascal Baltazar"]            = 'bodsiin'
# check ~> @users["Diemo Schwarz"]            = 'diemoschwarz'

# check ~> @users["Jesse Allison"]            = 'jesseallison'
@users["Julien Rabin"]               = 'jln-'
# check ~> @users[""]               = 'kitefishlabs'

# check ~> @users["Kristian Nymoen"]               = 'krisny'
@users["Trond Lossius"]              = 'lossius'
@users["Nils Peters"]                = 'nilson'

# check ~> @users["Nathan Wolek"]               = 'nwolek' 
# check ~> @users["Renaud Rubiano"]               = 'reno'
@users["Tim Place"]                  = 'tap'

@users["Th?o de la Hogue"]               = 'theod'
# check ~> @users["Tristian Matthew"]               = 'tmatth'
# check ~> @users["Tom Mays"]               = 'tmays'


def map_user( assignee )
	@users[assignee]
end