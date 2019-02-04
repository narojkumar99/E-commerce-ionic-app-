import { Component } from '@angular/core';
import { NavController, NavParams, ToastController, IonicPage } from 'ionic-angular';
import * as WC from 'woocommerce-api';
import { WoocommerceProvider } from "../../providers/woocommerce/woocommerce";
import {Http, Headers, RequestOptions}  from '@angular/http';
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http';
import 'rxjs/add/operator/map';
import { LoadingController } from 'ionic-angular';
// import { ProductDetailsPage } from "../product-details/product-details";

@IonicPage({})
@Component({
  selector: 'page-product-by-category',
  templateUrl: 'product-by-category.html',
})
export class ProductByCategoryPage {

  WooCommerce: any;
  products: any[];
  page: number;
  category: any;
  cname:any;

  constructor(public navCtrl: NavController,private http: Http, public navParams: NavParams, public toastCtrl: ToastController,  public loading: LoadingController,private WP: WoocommerceProvider) {

    this.page = 1;
    this.category = this.navParams.get("category");

   this.cname=this.category.categoryname;

    

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

this.http.post('http://192.168.225.39:8085/productbycategory.php',JSON.stringify(this.cname),options)

.map(res => res.json())

.subscribe(res => {

loader.dismiss()
 this.products = res;
 console.log(res);
 







});
});
}

 

  openProductPage(product)
  {
    this.navCtrl.push('ProductDetailsPage', {"product": product} )
  }

}
