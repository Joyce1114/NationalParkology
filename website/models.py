from sqlalchemy import sql, orm
from app import db

class NationalPark(db.Model):
	__tablename__ = 'nationalpark'
	pid = db.Column('id', db.Integer(), primary_key = True)
	name = db.Column('name', db.String(50))
	history = db.Column('history', db.String(500))
	url = db.Column('url', db.String(300))
    #delete this line from NPtest
	imgurl=db.Column('imgurl', db.String(300))
	# size = db.Column('size', db.Float())

class PriceInfo(db.Model):
	__tablename__ = 'priceinfo'
	price = db.Column('price', db.Float())
	tTime = db.Column('tTime', db.String(20), primary_key = True)
	people_group = db.Column('people_group', db.String(), primary_key = True)
	pid = db.Column('id', db.Integer(), db.ForeignKey('NationalPark.id'), 
		primary_key = True)

class Continent(db.Model):
	__tablename__ = 'continent'
	name = db.Column('name', db.String(50), primary_key = True)

class Country(db.Model):
	__tablename__ = 'country'
	name = db.Column('name', db.String(16), primary_key = True)
	language = db.Column('language', db.String(100))
	continent = db.Column('continent', db.String(30),
		db.ForeignKey('Continent.name'))

class IsInCountry(db.Model):
	__tablename__ = 'isincountry'
	pid = db.Column('park_id', db.Integer(), db.ForeignKey('NationalPark.id'),
    primary_key = True)
	country_name = db.Column('country_name', db.String(50), db.ForeignKey('Country.name'),
    primary_key = True)


class VisitorStats(db.Model):
	__tablename__ = 'visitorstats'
	year = db.Column('year', db.Integer(), primary_key = True)

class HasStats(db.Model):
	__tablename__ = 'hasstats'
	pid = db.Column('park_id', db.Integer(), db.ForeignKey('NationalPark.id'), primary_key = True)
	year = db.Column('year', db.Integer(), db.ForeignKey('VisitorStats.year'), primary_key = True)
	num = db.Column('num_visitor', db.Integer())


class IsOfGeology(db.Model):
    __tablename__ = 'isofgeology'
    pid = db.Column('park_id', db.Integer(), db.ForeignKey('NationalPark.id'),primary_key = True)
    name = db.Column('name', db.String(16), db.ForeignKey('Geology.name'), primary_key = True)
    description = db.Column('description', db.String(1024))

class Geology(db.Model):
    __tablename__ = 'geology'
    name = db.Column('name', db.String(16), primary_key = True)
    description = db.Column('description', db.String(1024))
    
class IsOfClimate(db.Model):
    __tablename__ = 'isofclimate'
    name = db.Column('name', db.String(50), 
                     db.ForeignKey('NationalPark.id'),
                     primary_key = True)
    pid = db.Column('park_id', db.Integer(),
                   db.ForeignKey('NationalPark.id'),
                   primary_key = True)
    
class Climate(db.Model):
    __tablename__ = 'climate'
    name = db.Column('name', db.String(50), primary_key = True)
    description = db.Column('description', db.String(1024))
    
class HasRecreation(db.Model):
    __tablename__ = 'hasrecreation'
    pid = db.Column('park_id', db.Integer(), 
                        db.ForeignKey('NationalPark.id'), 
                        primary_key = True) 
    recreation_name = db.Column('recreation_name', db.String(16),
                               db.ForeignKey('recreation.name'),
                               primary_key = True)
    description = db.Column('description', db.String(1024))
    
class Recreation(db.Model):
    __tablename__ = 'recreation'
    name = db.Column('name', db.String(16), primary_key = True)
    
    