import { Component ,ViewChild} from '@angular/core';
import { IonicPage, NavController, NavParams, ToastController, AlertController, Events } from 'ionic-angular';

import { Storage } from '@ionic/storage';
import {Http, Headers, RequestOptions}  from '@angular/http';
import { HttpClientModule } from '@angular/common/http'; 
import { HttpModule } from '@angular/http';
import { NetworkEngineProvider } from '../../providers/network-engine/network-engine';
import { SignupPage } from '../signup/signup';
import { HomePage } from '../home/home';
import { MenuPage } from '../menu/menu';


import { LoadingController } from 'ionic-angular';
import 'rxjs/add/operator/map';

@IonicPage({})
@Component({
  selector: 'page-login',
  templateUrl: 'login.html',
})
export class LoginPage {

  
  @ViewChild('username') username;

@ViewChild('password') password;


data:string;
responseTxt: any;
id:any;

  constructor(public navCtrl: NavController, public navParams: NavParams, public http: Http, public toastCtrl: ToastController, public storage: Storage, public alertCtrl: AlertController,public network:NetworkEngineProvider) {


  }


   



  

register() {

    this.navCtrl.push(SignupPage);
  }


  loginuser(u,p){

u = u;

  

//// check to confirm the username and password fields are filled

/*if(this.username.value==""){

let alert = this.alertCtrl.create({

title:"ATTENTION",

subTitle:"Username field is empty",

buttons: ['OK']

});

alert.present();

} else

if(this.password.value==""){

let alert = this.alertCtrl.create({

title:"ATTENTION",

subTitle:"Password field is empty",

buttons: ['OK']

});

alert.present();

}

else

{

var headers = new Headers();

headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json' );

let options = new RequestOptions({ headers: headers });

let data = {

username: this.username.value,

password: this.password.value

};

let loader = this.loading.create({

content: 'Processing please wait…',

});

loader.present().then(() => {

this.http.post('http://192.168.225.39:8085/login.php',data,options)


.map(res => res.json())


.subscribe(res => {

console.log(res)

loader.dismiss()


if(res=="Your Login success"){

let alert = this.alertCtrl.create({

title:"CONGRATS",

subTitle:(res),

buttons: ['OK']

});

alert.present();

}else

{

let alert = this.alertCtrl.create({

title:"ERROR",

subTitle:"Your Login Username or Password is invalid",

buttons: ['OK']

});

alert.present();

}

});

});

}
*/



this.network.login12(u,p).then(data =>

{

  




console.log("received:" + JSON.stringify(data));
  this.responseTxt = ""+ JSON.stringify(data);




  if(data=="Your Login success"){

    let alert = this.alertCtrl.create({

title:"Done",

subTitle:("Login success"),

buttons: ['OK']

});

alert.present();



  }

     this.storage.set("userLoginInfo", u).then( (data)=>{

      

      });;

   



  if(data=="Your Login Email or Password is invalid"){

    let alert = this.alertCtrl.create({

title:"oops!!!",

subTitle:("Login failed!!"),

buttons: ['OK']

});

alert.present();

  }


  
})

}



   

   
}
