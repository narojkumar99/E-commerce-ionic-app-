import { Component } from '@angular/core';
import { NavController, NavParams, ViewController, ToastController } from 'ionic-angular';
import { Storage } from "@ionic/storage";
import {Http, Headers, RequestOptions}  from '@angular/http';
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http';
import 'rxjs/add/operator/map';
import { CheckoutPage } from "../checkout/checkout";


@Component({
  selector: 'page-cart',
  templateUrl: 'cart.html',
})
export class CartPage {

  cartItems: any[] = [];
  total: any;
  showEmptyCartMessage: boolean = false;
  userid:any;
  use:any;

  constructor(public navCtrl: NavController,private http: Http, public navParams: NavParams, public storage: Storage, public viewCtrl: ViewController, public toastCtrl: ToastController) {

    this.total = 0;

    this.storage.ready().then(()=>{
      this.storage.get("cart").then((res)=>{
        this.cartItems = res;
        console.log();

        if(this.cartItems.length > 0){

          this.cartItems.forEach( (item, index)=> {
            this.total = this.total + (item.product.productprice * item.qty)
          })

        } else {

          this.showEmptyCartMessage = true;

        }

      })
    })

  }

  removeFromCart(item, i){

    let price = item.product.productprice;
    let qty = item.qty;

    this.cartItems.splice(i, 1);

    this.storage.set("cart", this.cartItems).then( ()=>{

      this.total = this.total - (price * qty);

    });

    if(this.cartItems.length == 0){
      this.showEmptyCartMessage = true;
    }

}

  closeModal(){
    this.viewCtrl.dismiss();
  }

  checkout(){
    this.storage.get("userLoginInfo").then( (data) => {
      if (data != null) {


        var headers = new Headers();

     headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json' );






let options = new RequestOptions({ headers: headers });


          this.http.post('http://192.168.225.39:8085/userid.php',JSON.stringify(data),options)

.map(res => res.json())

.subscribe(res => {


 this.userid = res;


 this.userid.forEach( (item, index)=> {
            this.use = item.userid
          
 console.log(this.use);
 







});

 this.navCtrl.push(CheckoutPage,{params1:this.use});


})




       
      }
      else {
       
      }
    })
  //this.navCtrl.push(CheckoutPage);

  }

  changeQty(item, i, change){
    let price = 0;
    let qty = 0;

    price = parseFloat(item.product.productprice);
    qty = item.qty;

    if (change < 0 && item.qty == 1) {
      return;
    } 

    qty = qty + change;
    item.qty = qty;
    item.amount = qty * price;

    this.cartItems[i] = item;

    this.storage.set("cart", this.cartItems).then( ()=> {

      this.toastCtrl.create({
        message: "Cart Updated.",
        duration: 2000,
        showCloseButton: true
      }).present();

    });

    this.total = (parseFloat(this.total.toString()) + (parseFloat(price.toString()) * change));

  }

}
