316 Project

How to set up the database and run our web app

* First of all make sure vagrant's port 5000 is also forwarded to host machine's port 5000 in `vagrantfile`.
* Start vagrant using the usual procedure (make sure the project directory is in the vagrant shared folder)
* In the command line, type `createdb NP`
* Go to `database` folder. In there we have a file named `finalNPDump.sql`, a dump file created by PGAdmin4
* Run `psql -d NP -af finalNPDump.sql` and the database is set up
* Go to `/website` and run `python app.py`. The server is setup. Go to your browser c, and visit 'localhost/5000'.
