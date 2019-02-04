import { Component, ViewChild } from '@angular/core';
import {Http, Headers, RequestOptions}  from '@angular/http';
import { HttpClientModule } from '@angular/common/http'; 
import { HttpModule } from '@angular/http';
import { NavController, Slides, ToastController, IonicPage } from 'ionic-angular';
import 'rxjs/add/operator/map';
import * as WC from 'woocommerce-api';
// import { ProductDetailsPage } from "../product-details/product-details";
// import { SearchPage } from '../search/search';
import { WoocommerceProvider } from "../../providers/woocommerce/woocommerce";
import { LoadingController } from 'ionic-angular';




@IonicPage({})
@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  WooCommerce: any;
  products: any[];
  page: number;
  moreproducts: any[];
  searchQuery: string = "";
  headers:any[]


  @ViewChild('productSlides') productSlides: Slides;

  constructor(public navCtrl: NavController, public toastCtrl: ToastController,  private http: Http, public loading: LoadingController) {

this.page=2;

   // this.LoadMoreProducts(null);

  




 
   
   

  }


 


  ionViewDidLoad(){





var headers = new Headers();

     headers.append("Accept", 'application/json');

headers.append('Content-Type', 'application/json' );






let options = new RequestOptions({ headers: headers });

let loader = this.loading.create({

content: 'Processing please wait…',

});

loader.present().then(() => {

this.http.post('http://192.168.225.39:8085/allproducts.php',options)

.map(res => res.json())

.subscribe(res => {

loader.dismiss()
 this.products = res;
 console.log(res);
 







});
});







    setInterval(() => {

      if (this.productSlides.getActiveIndex() == this.productSlides.length() -1) {
        this.productSlides.slideTo(0)
      }

      this.productSlides.slideNext();
    }, 3000)
  }

  /*LoadMoreProducts(event){

    if (event == null) {
      this.page = 2;
      this.moreproducts = [];
    }
    else {
      this.page ++;
    }
  
  }*/

  openProductPage(products)
  {
    this.navCtrl.push('ProductDetailsPage', {"product": products} )
  }

  onSearch(event){
    if (this.searchQuery.length > 0) {
      this.navCtrl.push('SearchPage', {"searchQuery": this.searchQuery});
    }
  }

}
