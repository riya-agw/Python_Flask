from flask import Flask ,render_template,Response,make_response,request,session,abort,jsonify,flash,redirect,url_for
import secrets
from flask_mysqldb import MySQL
from wtforms import validators,form
import MySQLdb.cursors
import os
import mysql.connector
import json
import socket
import secrets
from flask_mail import Mail,Message
from flask_sqlalchemy import SQLAlchemy
from flask import send_from_directory
from base64 import b64encode


app = Flask(__name__)
'secret key'
app.secret_key='super-secret-key'
'login page mysql-error'
mysql=MySQL(app)
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']='1234'
app.config['MYSQL_DB']='restaurant'
app.config['MYSQL_HOST']='localhost'
app.secret_key='super-secret-key'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:1234@localhost/restaurant'
db=SQLAlchemy(app)


with open('config.json','r') as c:
    params=json.load(c)["params"]

app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password'] 
)
mail=Mail(app)
socket.getaddrinfo('localhost', 3006)

class C_info(db.Model):
    SN = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(80),nullable=False)
    Mobileno = db.Column(db.String(12), nullable=False)
    Email= db.Column(db.String(20))
    Message = db.Column(db.String(150))

class C_new(db.Model):
    SN = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(12), nullable=False)
    Mobileno = db.Column(db.String(12), nullable=False)
    Email = db.Column(db.String(20),nullable=False)
    Setpwd = db.Column(db.String(15), nullable=False)
    Confirmpwd = db.Column(db.String(15), nullable=False)
    

class Menu_rates(db.Model):
    SN = db.Column(db.Integer,primary_key=True)
    Dish = db.Column(db.String(40), nullable=False)
    Price = db.Column(db.Float(12), nullable= False)
    Ingredients = db.Column(db.String(50))
    images = db.Column(db.String(120))


static_folder='static'
@app.route('/')
def index():
    return render_template('home.html')

@app.route('/home')
def home():
    return render_template("home.html")

@app.route('/about-us')
def aboutus():
    return render_template("about.html")


@app.route('/menu')
def menu():
    return render_template('menu.html')

@app.route('/membership')
def member():
    return render_template('membership.html')

@app.route('/feedback')
def feedback():
    return render_template('feedback.html')

@app.route('/offers')
def offers():
   return render_template('offers.html')

@app.route('/contact-us',methods=['GET','POST'])
def contact():
    if (request.method=='POST'):
        '''Add entry to data'''
        name=request.form.get('name')
        email=request.form.get('email')
        mobile=request.form.get('mobile')
        message=request.form.get('message')
        entry=c_info(Name=name,Mobileno=mobile,Email=email,Message=message )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Message from  ' +name,
                            sender='lakeviewrestro@gmail.com', 
                            recipients=[params['gmail-user']], 
                            body='Hello Lakeview Restro,' +"\n" + message +"\n" +'Contact: ' + mobile
                        )
    return render_template("contact.html")


@app.errorhandler(400)
def custom400(error):
    return make_response(jsonify(error.description),400)


@app.route('/create',methods=['GET','POST'])
def create():
    if (request.method=='POST') :
        name=request.form.get('name')
        mobileno =request.form.get('mobileno')
        email=request.form.get('email')
        spassword=request.form.get('spassword')
        cpassword=request.form.get('cpassword')
        form=create
        if form.validate_on_submit():
            if len(name)>15:
                flash('Username length error')
                return redirect('create')
        
            
        entry=C_new(Name=name,Mobileno=mobileno,Email=email,Setpwd=spassword,Confirmpwd=cpassword)
        db.session.add(entry)
        db.session.commit()
    return render_template('create.html')

@app.route('/login',methods=['GET','POST'])
def login():
    session['logged_in']=''
    session['user']=''
    if(request.method=='POST'):
        email=request.form.get('email')
        password=request.form.get('password')
        cursor=mysql.connection.cursor()
        cursor.execute("""SELECT * FROM C_new WHERE Email=%s AND confirmpwd=%s""" ,(email,password))
        C = cursor.fetchone()
        print(C)
        if C is None:
            flash("OOPSS!! Username Not found. Try Again")
            return render_template('login.html')
        elif session['user']==email:
            flash('Already logged In!!')
            return redirect(url_for('order',username=C[3]))
        elif(C[3]==email and C[5]==password):
            session['user']=email
            session['name']=C[1]
            session['logged_in']=True
            return redirect(url_for('order'))        
    return render_template('login.html')


#@app.route('/logout',methods=['GET','POST'])
#def logout():
#    session.pop{'user',none}

    
@app.route('/order')
def order():
    j=0
    image=[]
    cursor=mysql.connection.cursor()
    cursor.execute("""SELECT * FROM Menu_rates WHERE Category='Italian'""")
    italian=cursor.fetchall()
    cursor.execute("""SELECT * FROM Menu_rates WHERE Category='Sandwiches'""")
    sandwich=cursor.fetchall()
    return render_template('order.html',italian=italian,sandwich=sandwich)


@app.route('/order1')
def order1():
    return render_template('order1.html')

@app.route('/checkout')
def checkout():
    return render_template('checkout.html')


@app.route('/table')
def table():
   return render_template('table.html')

if  __name__ == "__main__":
   app.run(debug=True)