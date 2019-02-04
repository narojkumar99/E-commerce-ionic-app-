import { Component } from '@angular/core';
import { NavController, NavParams, ToastController, ModalController, IonicPage} from 'ionic-angular';
import * as WC from 'woocommerce-api';
import { WoocommerceProvider } from "../../providers/woocommerce/woocommerce";
import { CartPage } from "../cart/cart";

import { Storage } from "@ionic/storage";
import {Http, Headers, RequestOptions}  from '@angular/http';
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http';
import 'rxjs/add/operator/map';
import { LoadingController } from 'ionic-angular';
 
@IonicPage({})
@Component({
  selector: 'page-product-details',
  templateUrl: 'product-details.html',
})
export class ProductDetailsPage {

  product: any;
  WooCommerce: any;
  reviews: any[] = [];
  pid:any;
  re: any;

  constructor(public navCtrl: NavController, private http: Http,public navParams: NavParams, public storage: Storage, public toastCtrl: ToastController, public modalCtrl: ModalController,  public loading: LoadingController,private WP: WoocommerceProvider) {

    this.product = this.navParams.get("product");

    this.pid=this.product.productid;


   
     
   

  }


 ionViewDidLoad(){





var headers = new Headers();

     headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json' );






let options = new RequestOptions({ headers: headers });

let loader = this.loading.create({

content: 'please wait… products loading',

});

loader.present().then(() => {

this.http.post('http://192.168.225.39:8085/productdetail.php',JSON.stringify(this.pid),options)

.map(res => res.json())

.subscribe(res => {


 this.reviews = res;
 console.log(res);
 







});


this.http.post('http://192.168.225.39:8085/review.php',JSON.stringify(this.pid),options)

.map(res => res.json())

.subscribe(res => {

loader.dismiss()
 this.re = res;
 console.log(res);
 







});
});




}





   addToCart(product) {
        this.storage.get("cart").then((res) => {
    
          if (res == null || res.length == 0) {
            res = [];
    
            res.push({
              "product": product.productname,
              "qty": 1,
              "amount": parseFloat(product.productprice)
            })
          } else {
    
            let added = 0;
    
            for (let i = 0; i < res.length; i++) {
    
              if (product.productid == res[i].productid) {
                let qty = res[i].qty;
    
                console.log("Product is already in the cart");
    
                res[i].qty = qty + 1;
                res[i].amount = parseFloat(res[i].amount) + parseFloat(res[i].product.price);
                added = 1;
              }
    
            }
    
            if (added == 0) {
              res.push({
                "product": product,
                "qty": 1,
                "amount": parseFloat(product.productprice)
              })
            }
    
          }
    
          this.storage.set("cart", res).then(() => {
            console.log("Cart Updated");
            console.log(res);
    
            this.toastCtrl.create({
              message: "Cart Updated",
              duration: 3000
            }).present();
  
          })
    
        })
    
      }

      openCart(){

        this.modalCtrl.create(CartPage).present();

      }


}
