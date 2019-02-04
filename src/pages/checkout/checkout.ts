import { Component ,ViewChild} from '@angular/core';
import { NavController, NavParams, AlertController, IonicPage } from 'ionic-angular';
import { Storage } from '@ionic/storage';
import * as WC from "woocommerce-api";
import { WoocommerceProvider } from "../../providers/woocommerce/woocommerce";
import {Http, Headers, RequestOptions}  from '@angular/http';
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http';
import 'rxjs/add/operator/map';

// import { HomePage } from '../home/home';

@IonicPage({})
@Component({
  selector: 'page-checkout',
  templateUrl: 'checkout.html',
})
export class CheckoutPage {

  WooCommerce: any;
  prevData: any;
p:any;
q:any;
a:any;
ono:any;
o:any;
userid:any;
formval:any;
  newOrder: any;
  paymentMethods: any[];
  paymentMethod: any;
  billing_shipping_same: boolean;
  userInfo: any;

    @ViewChild("address1") address1;

@ViewChild("address2") address2;
@ViewChild("state") state;

@ViewChild("country") country;


@ViewChild("city") city;
@ViewChild("postalcode") postalcode;
@ViewChild("phone") phone;


  constructor(public navCtrl: NavController,public navParamas: NavParams,private http: Http, public navParams: NavParams, public storage: Storage, public alertCtrl: AlertController, private WP: WoocommerceProvider) {
 

    this.newOrder = {};
    
    this.newOrder.billing_address = {};
    this.newOrder.shipping_address = {};
    this.billing_shipping_same = false;

    this.paymentMethods = [
      { method_id: "bacs", method_title: "Direct Bank Transfer" },
      { method_id: "cheque", method_title: "Cheque Payment" },
      { method_id: "cod", method_title: "Cash On Delivery" },
      { method_id: "paypal", method_title: "PayPal" }      
    ];

  
this.prevData = navParamas.get("params1");
     

  }


  ionViewDidLoad(){









 let headers = new Headers();
   

    headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json');






      this.http.post('http://192.168.225.39:8085/retreiveuser.php', JSON.stringify(this.prevData))

      .map(data => data.json())

      .subscribe(data => {
        // let rooms = JSON.parse();

        this.formval=data;
         console.log(data);
       
      }, error => {
        let errors = JSON.stringify(error.json());
        console.log(errors);
      
        // this.navCtrl.push(AboutPage, {params1: errors, params2: this.loader});
      });







   

   // this.WooCommerce = WP.init();

    /*this.storage.get("userLoginInfo").then( (userLoginInfo)=>{
      this.userInfo = userLoginInfo.user;

      let email = userLoginInfo.user.email;

      this.WooCommerce.getAsync("customers/email/"+email).then( (data) => {
        this.newOrder = JSON.parse(data.body).customer;
      })

    })*/

 
    






  }




  placeOrder(){





    
      let headers = new Headers();
   

    headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json');

//let options = new RequestOptions({ headers: headers });




    


    let data1 = {

     
      address1: this.address1.value,
       userid:this.prevData,
      address2 : this.address2.value,
      country:this.country.value,
      state:this.state.value,
      city:this.city.value,
      postalcode:this.postalcode.value,
      phone:this.phone.value


    }


console.log(data1);

      this.http.post('http://192.168.225.39:8085/shippingdetails.php', JSON.stringify(data1))

      

      .subscribe(res => {
        // let rooms = JSON.parse();

       
         console.log(res);
       
      });





    let paymentData: any = {};

    this.paymentMethods.forEach( (element, index) => {
      if (element.method_id =="Cash On Delivery") {
        paymentData = element;
      }
    });

     

    if (paymentData.method_id == "paypal") {
      //TODO
    }

   if (paymentData.method_id == "Cash On Delivery") {
      //TODO




    }
    
      let   cartItems :any[] = [];

 let body :any ={};
 


 this.storage.get("cart").then((cart)=>{
       cart.forEach( (element, index) => {
          cartItems.push({
            product_id: element.product.productid,
            quantity: element.qty,
            amount:element.amount
          


          });
           this.p=element.product.productid;
          this.q=element.qty;
         this.a=element.amount;
    



        console.log(cartItems);
        })

       body = {
        userid: this.prevData,
        productid: this.p,
        qty:  this.q,
        total: this.a,
        paymentmethod:"Cash On Delivery"
        
      }

       let headers = new Headers();
   

    headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json');






      this.http.post('http://192.168.225.39:8085/insertorder.php', JSON.stringify(body))

      .map(res => res.json())

      .subscribe(res => {
        // let rooms = JSON.parse();
         

            this.ono=res;

            this.ono.forEach( (item, index)=> {
            this.o = item.ordernumber
          
             console.log(this.o);
 







});

          this.alertCtrl.create({
            title: "Order Placed Successfully",
            message: "Your order has been placed successfully. Your number is " + this.o,
            buttons: [{
              text: "OK",
              handler: () => {
                this.navCtrl.setRoot('HomePage'); 
              }
            }]
          }).present();
       
      }, error => {
        let errors = JSON.stringify(error.json());
        console.log(errors);
      
        // this.navCtrl.push(AboutPage, {params1: errors, params2: this.loader});
      });


      console.log(body);
    });





  

   /* else {
      this.storage.get("cart").then( (cart) => {
        cart.forEach( (element, index) => {
          orderItems.push({
            product_id: element.product.productid,
            quantity: element.qty
          });
        });

        data.line_items = orderItems;

        let orderData: any = {};

        orderData.order = data;

        this.WooCommerce.postAsync("orders", orderData).then( (data) => {

          let response = (JSON.parse(data.body).order);

         

        })

      })
    }*/

  }


}
