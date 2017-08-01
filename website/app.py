'''
Todo

1. park's own page
2. more robust query
3. more query options?
4. filer options in search result page
5. front end is not so important; WE NEED MORE DATA

'''


from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
import models
import forms


app = Flask(__name__)
app.secret_key = 's3cr3t'
app.config.from_object('config')
db = SQLAlchemy(app, session_options={'autocommit': False})
global table_before
global CLIMATES
global CONTINENTS
global GEOLOGIES
global history
history = {}



@app.route('/')
def index():
    return render_template('search.html')

@app.route('/search_result', methods=['GET', 'POST'])
def search_result():
    print('####################################\n')
    raw_name=request.form['name']
    print('debug in app.py show_result.\nraw name from form is {}\n'.format(raw_name))

    raw_country=request.form['country']
    print('debug in app.py show_result.\nraw country from form is {}\n'.format(raw_country))

    raw_activity=request.form['activity']
    print('debug in app.py show_result.\nraw activity from form is {}\n'.format(raw_activity))
    print('####################################\n')

    name=process_raw_str(raw_name)
    country=process_raw_str(raw_country)
    activity=process_raw_str(raw_activity)

    print('####################################\n')
    raw_name = request.form['name']
    print('debug in app.py show_result.\nname from form is {}\n'.format(name))

    raw_country = request.form['country']
    print('debug in app.py show_result.\ncountry from form is {}\n'.format(country))

    raw_activity = request.form['activity']

    

    print('debug in app.py show_result.\nactivity from form is {}\n'.format(activity))
    
#, models.IsInCountry, models.Country, models.HasRecreation, models.Recreation
    bigJoin = db.session.query(models.NationalPark).\
    filter(models.Country.name == models.IsInCountry.country_name,\
    models.IsInCountry.pid == models.NationalPark.pid,\
    models.Recreation.name == models.HasRecreation.recreation_name,\
    models.HasRecreation.pid == models.NationalPark.pid).\
    filter(models.NationalPark.name.ilike(name),\
    models.Country.name.ilike(country),\
    models.Recreation.name.ilike(activity))

    global CLIMATES
    CLIMATES=db.session.query(models.Climate).all()
    global CONTINENTS
    CONTINENTS=db.session.query(models.Continent).all()
    global GEOLOGIES
    GEOLOGIES=db.session.query(models.Geology).all()

    global table_before
    table_before = bigJoin

    key = "PARK: " + name + "COUNTRY: " + country + "ACTIVITY: " + activity
    history[key] = bigJoin.all()

    print('debug in app.py show_result.\nhistory from form is {}\n'.format(history))

    return render_template('search_result.html', data=bigJoin.all(), myClimates=CLIMATES, myGeologies=GEOLOGIES, myContinents=CONTINENTS, dict = history)


@app.route('/history')
def show_history():
    return render_template('history.html',data=history)

@app.route('/history/result/<e>')
def history_route(e):
    joindata = history.get(e)
    return render_template('search_result.html', data=joindata, myClimates=CLIMATES,\
    myGeologies=GEOLOGIES, myContinents=CONTINENTS)


@app.route('/search_result/<int:id>')
def show_park(id):
    parkTuple=db.session.query(models.NationalPark,models.Country).\
    filter(models.Country.name==models.IsInCountry.country_name,\
    models.IsInCountry.pid==models.NationalPark.pid).\
    filter(models.NationalPark.pid==id).one()


    geologyTypes=db.session.query(models.Geology).\
    filter(models.IsOfGeology.pid==id,\
    models.IsOfGeology.name==models.Geology.name).\
    filter(models.NationalPark.pid==id).all()


    climateTypes=db.session.query(models.Climate, models.IsOfClimate).\
    filter(models.IsOfClimate.pid==id,\
    models.IsOfClimate.name==models.Climate.name).\
    filter(models.NationalPark.pid==id).all()

    recreations=db.session.query(models.HasRecreation).\
    filter(models.HasRecreation.pid==id,\
    models.HasRecreation.recreation_name==models.Recreation.name).\
    filter(models.NationalPark.pid==id).all()

    country=db.session.query(models.Country).\
    filter(models.IsInCountry.pid==id,\
    models.IsInCountry.country_name==models.Country.name).\
    filter(models.NationalPark.pid==id).one()


    return render_template('park.html', parkTuple=parkTuple,\
    geologyTypes=geologyTypes, climateTypes=climateTypes,\
    myCountry=country, myRecreations=recreations, trim_blocks=True)


@app.route('/search_result/filter_result', methods=['GET', 'POST'])
def show_filter_result():
    print(request.form['pricemin'])
    print(request.form['pricemax'])

    raw_price_min = request.form['pricemin']
    raw_price_max = request.form['pricemax']
    raw_continent = request.form['continent']
    raw_climate = request.form['climate']
    raw_geology = request.form['geology']
    
    newTable = table_before

    if(represents_valid_number(raw_price_max)):
        newTable = newTable.filter(models.NationalPark.pid == models.PriceInfo.pid).filter(models.PriceInfo.price <= raw_price_max)
    if(represents_valid_number(raw_price_min)):
        newTable = newTable.filter(models.NationalPark.pid == models.PriceInfo.pid).filter(models.PriceInfo.price >= raw_price_min)
    if (represents_valid_string(raw_continent)):
        newTable = newTable.filter(models.NationalPark.pid == models.IsInCountry.pid).filter(models.IsInCountry.country_name == models.Country.name).\
        filter(models.Country.continent.ilike(process_raw_str(raw_continent)))
    if (represents_valid_string(raw_climate)):
        newTable = newTable.filter(models.NationalPark.pid == models.IsOfClimate.pid).filter(models.IsOfClimate.name.ilike(process_raw_str(raw_climate)))
    if (represents_valid_string(raw_geology)):
        newTable = newTable.filter(models.NationalPark.pid == models.IsOfGeology.pid).filter(models.IsOfGeology.name.ilike(process_raw_str(raw_geology)))

    key = "MIN_PRICE: " + raw_price_min + "MAX_PRICE: " + raw_price_max + "CONTINENT: " + process_raw_str(raw_continent) + "CLIMATE: " + process_raw_str(raw_climate) + "GEOLOGY: " + process_raw_str(raw_geology)
    history[key] = newTable.all()


    return render_template('search_result.html', data=newTable.all(),  myClimates=CLIMATES, myGeologies=GEOLOGIES, myContinents=CONTINENTS)


def represents_valid_number(str):
    '''
    returns true if the string, when passed to sql query as a number, will not break the query
    '''
    if len(str)==0:
        return False
    try:
        x = float(str)
        return True
    except:
        return False

def represents_valid_string(str):
    '''
    returns true if the string, when passed to sql query as a string, will not break the query
    '''
    if len(str) == 0 or str.lower() == "all":
        return False
    else:
        return True


def process_raw_str(raw_str):   
    return '%'+raw_str+'%'

@app.template_filter('pluralize')
def pluralize(number, singular='', plural='s'):
    return singular if number in (0, 1) else plural


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

