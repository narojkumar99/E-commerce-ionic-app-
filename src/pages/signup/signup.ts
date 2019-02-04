import { Component,ViewChild } from '@angular/core';
import { IonicPage, NavController, NavParams ,AlertController } from 'ionic-angular';


import {Http, Headers, RequestOptions}  from '@angular/http';
import { HttpClientModule } from '@angular/common/http'; 
import { HttpModule } from '@angular/http';
import { LoadingController } from 'ionic-angular';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';


import { LoginPage } from '../login/login';

/**
 * Generated class for the SignupPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-signup',
  templateUrl: 'signup.html',
})
export class SignupPage {

myForm: FormGroup;

  //@ViewChild("name") name;

//@ViewChild("username") username;

//@ViewChild("email") email;

//@ViewChild("password") password;

//@ViewChild("confirmpassword") confirmpassword;

  constructor(public navCtrl: NavController, public navParams: NavParams,public alertCtrl: AlertController,  private http: Http,  public loading: LoadingController, public formBuilder: FormBuilder) {
  
     this.myForm = this.formBuilder.group ({

         

        name: ['', Validators.compose([Validators.minLength(5), Validators.pattern('[a-zA-Z ]*'), Validators.required])],
        username: ['', Validators.compose([Validators.maxLength(30), Validators.pattern('[a-zA-Z0-9 ]+'), Validators.required])],
        password: ['', Validators.compose([Validators.required])],
        confirmpassword: ['', Validators.compose([ Validators.required])],

         email: ['', Validators.compose([Validators.email, Validators.required])],
        

       
      });




  }





  onSubmit(myForm){

   this.submitAttempt = true;
 
  if(!this.myForm.valid){






  }else{

var headers = new Headers();

headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json' );

let options = new RequestOptions({ headers: headers });

let data = {



password: this.myForm.value.password,
name : this.myForm.value.name,
username:this.myForm.value.username,

confirmpassword:this.myForm.value.confirmpassword,

email:this.myForm.value.email

};







let loader = this.loading.create({

content: 'Processing please wait…',

});

loader.present().then(() => {

this.http.post('http://192.168.225.39:8085/register.php',JSON.stringify(data), options)

.map(res => res.json())

.subscribe(res => {

loader.dismiss()

if(res=="Registration successfull"){

let alert = this.alertCtrl.create({

title:"whola,Done",

subTitle:("Login to continue"),

buttons: ['OK']

});

this.navCtrl.push(LoginPage);

alert.present();


}else

{

let alert = this.alertCtrl.create({

title:"oops!!",

subTitle:("Registration unsuccesfull!!"),

buttons: ['OK']

});

alert.present();

}

});

});


}

  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad SignupPage');
  }

}
