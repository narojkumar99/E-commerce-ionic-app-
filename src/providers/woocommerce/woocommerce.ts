import { Injectable } from '@angular/core';
import * as WC from 'woocommerce-api';

@Injectable()
export class WoocommerceProvider {

  WooCommerce: any;

  constructor() {
    this.WooCommerce = WC({
      url: "http://localhost:81/wordpress",
      consumerKey: "ck_c02acdbe48e89ef45a1bc56ac9bd377cc7adf4e0",
      consumerSecret: "cs_3b2d8e1d14e46eddf223a0df37615aa20594fcf3",
      wpAPI: true,
      version: "wc/V2"
    });
  }

  init(){
    return this.WooCommerce;
  }

}
