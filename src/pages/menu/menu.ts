import { Component, ViewChild } from '@angular/core';
import { NavController, NavParams, ModalController, IonicPage } from 'ionic-angular';
// import { HomePage } from '../home/home';

 import { LoginPage } from "../login/login";
 import { SignupPage } from "../signup/signup";

import { CartPage } from "../cart/cart";
import * as WC from 'woocommerce-api';
 import { ProductByCategoryPage } from "../product-by-category/product-by-category";
 import {Http, Headers, RequestOptions}  from '@angular/http';
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http';
import 'rxjs/add/operator/map';

import { Storage } from "@ionic/storage";
import { IonicPageModule } from 'ionic-angular/module';
import { WoocommerceProvider } from "../../providers/woocommerce/woocommerce";

@IonicPage({})
@Component({
  selector: 'page-menu',
  templateUrl: 'menu.html',
})
export class MenuPage {

  homePage: any;
  WooCommerce: any;
  categories: any[];
  @ViewChild('content') childNavCtrl: NavController;
  loggedIn: boolean;
  user: any;

  constructor(public navCtrl: NavController, public navParams: NavParams,private http: Http, public storage: Storage, public modalCtrl: ModalController, private WP: WoocommerceProvider) {
    this.homePage = 'HomePage'
    this.categories = [];
    this.user = {};


  }




 


  

  ionViewDidLoad() {
    var headers = new Headers();

     headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json' );






let options = new RequestOptions({ headers: headers });





this.http.post('http://192.168.225.39:8085/categories.php',options)

.map(res => res.json())

.subscribe(res => {

 
 console.log(res);
 
   let temp: any[] = res;

      for(let i = 0; i < temp.length; i ++)
      {
        
if (temp[i].categoryname == "Books") {
            temp[i].icon = "book"
          }
          if (temp[i].categoryname == "Grocery") {
            temp[i].icon = "basket"
          }
           if (temp[i].categoryname == "Furniture") {
            temp[i].icon = "home"
          }
          if (temp[i].categoryname == "Fashion") {
            temp[i].icon = "shirt"
          }
          if (temp[i].categoryname == "Electronics") {
            temp[i].icon = "desktop"
          }
         
          console.log(temp[i])
          this.categories.push(temp[i]);
        
      }






});




    this.storage.ready().then( () => {
      this.storage.get("userLoginInfo").then( (userLoginInfo) => {

        if (userLoginInfo != null) {
          console.log("User logged in...");
          this.user = userLoginInfo;
          console.log(this.user);
          this.loggedIn = true;
        } else {
          console.log("No user found.");
          this.user = {};
          this.loggedIn = false;
        }

      })
    })
  }

  openCategoryPage(category) {
    this.childNavCtrl.setRoot('ProductByCategoryPage', { "category": category } )
  }

  openPage(pageName: string){
    if (pageName == "signup") {
      this.navCtrl.push('SignupPage');
    }
    if (pageName == "login") {
      this.navCtrl.push('LoginPage');
    }
    if (pageName == "logout") {
      this.storage.remove("userLoginInfo").then( ()=>{
        this.user = {};
        this.loggedIn = false;
      }) 
    }
    if (pageName == "cart") {
      let modal = this.modalCtrl.create(CartPage);
      modal.present();
    }
  }

}
