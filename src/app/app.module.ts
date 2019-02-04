import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';


import { MyApp } from './app.component';

// import { HomePage } from '../pages/home/home';
// import { MenuPage } from "../pages/menu/menu";
// import { ProductByCategoryPage } from "../pages/product-by-category/product-by-category";
// import { ProductDetailsPage } from "../pages/product-details/product-details";
import { CartPage } from "../pages/cart/cart";
import { CheckoutPage } from '../pages/checkout/checkout';

// import { SignupPage } from "../pages/signup/signup";
// import { LoginPage } from "../pages/login/login";
// import { CheckoutPage } from "../pages/checkout/checkout";
// import { SearchPage } from "../pages/search/search";

import { HttpClientModule } from '@angular/common/http'; 
import { HttpModule } from "@angular/http";


import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import { OneSignal } from "@ionic-native/onesignal";
import { IonicStorageModule } from "@ionic/storage";
import { WoocommerceProvider } from "../providers/woocommerce/woocommerce";
import { NetworkEngineProvider } from '../providers/network-engine/network-engine';


@NgModule({
  declarations: [
    MyApp,
   
    CartPage,
    CheckoutPage
  ],
  imports: [
    BrowserModule,
    HttpModule,
    HttpClientModule,
    IonicModule.forRoot(MyApp),
    IonicStorageModule.forRoot()
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
     
    CartPage,
     CheckoutPage
     
  ],
  providers: [
    StatusBar,
    SplashScreen,
    OneSignal,
    {provide: ErrorHandler, useClass: IonicErrorHandler},
    WoocommerceProvider,
       NetworkEngineProvider
  ]
})
export class AppModule {}
