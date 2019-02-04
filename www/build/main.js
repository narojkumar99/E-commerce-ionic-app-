webpackJsonp([8],{

/***/ 182:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return WoocommerceProvider; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_woocommerce_api__ = __webpack_require__(391);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_woocommerce_api___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_1_woocommerce_api__);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var WoocommerceProvider = /** @class */ (function () {
    function WoocommerceProvider() {
        this.WooCommerce = __WEBPACK_IMPORTED_MODULE_1_woocommerce_api__({
            url: "http://localhost:81/wordpress",
            consumerKey: "ck_c02acdbe48e89ef45a1bc56ac9bd377cc7adf4e0",
            consumerSecret: "cs_3b2d8e1d14e46eddf223a0df37615aa20594fcf3",
            wpAPI: true,
            version: "wc/V2"
        });
    }
    WoocommerceProvider.prototype.init = function () {
        return this.WooCommerce;
    };
    WoocommerceProvider = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["A" /* Injectable */])(),
        __metadata("design:paramtypes", [])
    ], WoocommerceProvider);
    return WoocommerceProvider;
}());

//# sourceMappingURL=woocommerce.js.map

/***/ }),

/***/ 183:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return CheckoutPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__ionic_storage__ = __webpack_require__(108);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__providers_woocommerce_woocommerce__ = __webpack_require__(182);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5_rxjs_add_operator_map__ = __webpack_require__(181);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_5_rxjs_add_operator_map__);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






// import { HomePage } from '../home/home';
var CheckoutPage = /** @class */ (function () {
    function CheckoutPage(navCtrl, navParamas, http, navParams, storage, alertCtrl, WP) {
        this.navCtrl = navCtrl;
        this.navParamas = navParamas;
        this.http = http;
        this.navParams = navParams;
        this.storage = storage;
        this.alertCtrl = alertCtrl;
        this.WP = WP;
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
    CheckoutPage.prototype.ionViewDidLoad = function () {
        var _this = this;
        var headers = new __WEBPACK_IMPORTED_MODULE_4__angular_http__["a" /* Headers */]();
        headers.append("Accept", 'application/json');
        headers.append('Content-Type', 'application/json');
        this.http.post('http://192.168.225.39:8085/retreiveuser.php', JSON.stringify(this.prevData))
            .map(function (data) { return data.json(); })
            .subscribe(function (data) {
            // let rooms = JSON.parse();
            _this.formval = data;
            console.log(data);
        }, function (error) {
            var errors = JSON.stringify(error.json());
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
    };
    CheckoutPage.prototype.placeOrder = function () {
        var _this = this;
        var headers = new __WEBPACK_IMPORTED_MODULE_4__angular_http__["a" /* Headers */]();
        headers.append("Accept", 'application/json');
        headers.append('Content-Type', 'application/json');
        //let options = new RequestOptions({ headers: headers });
        var data1 = {
            address1: this.address1.value,
            userid: this.prevData,
            address2: this.address2.value,
            country: this.country.value,
            state: this.state.value,
            city: this.city.value,
            postalcode: this.postalcode.value,
            phone: this.phone.value
        };
        console.log(data1);
        this.http.post('http://192.168.225.39:8085/shippingdetails.php', JSON.stringify(data1))
            .subscribe(function (res) {
            // let rooms = JSON.parse();
            console.log(res);
        });
        var paymentData = {};
        this.paymentMethods.forEach(function (element, index) {
            if (element.method_id == "Cash On Delivery") {
                paymentData = element;
            }
        });
        if (paymentData.method_id == "paypal") {
            //TODO
        }
        if (paymentData.method_id == "Cash On Delivery") {
            //TODO
        }
        var cartItems = [];
        var body = {};
        this.storage.get("cart").then(function (cart) {
            cart.forEach(function (element, index) {
                cartItems.push({
                    product_id: element.product.productid,
                    quantity: element.qty,
                    amount: element.amount
                });
                _this.p = element.product.productid;
                _this.q = element.qty;
                _this.a = element.amount;
                console.log(cartItems);
            });
            body = {
                userid: _this.prevData,
                productid: _this.p,
                qty: _this.q,
                total: _this.a,
                paymentmethod: "Cash On Delivery"
            };
            var headers = new __WEBPACK_IMPORTED_MODULE_4__angular_http__["a" /* Headers */]();
            headers.append("Accept", 'application/json');
            headers.append('Content-Type', 'application/json');
            _this.http.post('http://192.168.225.39:8085/insertorder.php', JSON.stringify(body))
                .map(function (res) { return res.json(); })
                .subscribe(function (res) {
                // let rooms = JSON.parse();
                _this.ono = res;
                _this.ono.forEach(function (item, index) {
                    _this.o = item.ordernumber;
                    console.log(_this.o);
                });
                _this.alertCtrl.create({
                    title: "Order Placed Successfully",
                    message: "Your order has been placed successfully. Your number is " + _this.o,
                    buttons: [{
                            text: "OK",
                            handler: function () {
                                _this.navCtrl.setRoot('HomePage');
                            }
                        }]
                }).present();
            }, function (error) {
                var errors = JSON.stringify(error.json());
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
    };
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])("address1"),
        __metadata("design:type", Object)
    ], CheckoutPage.prototype, "address1", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])("address2"),
        __metadata("design:type", Object)
    ], CheckoutPage.prototype, "address2", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])("state"),
        __metadata("design:type", Object)
    ], CheckoutPage.prototype, "state", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])("country"),
        __metadata("design:type", Object)
    ], CheckoutPage.prototype, "country", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])("city"),
        __metadata("design:type", Object)
    ], CheckoutPage.prototype, "city", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])("postalcode"),
        __metadata("design:type", Object)
    ], CheckoutPage.prototype, "postalcode", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])("phone"),
        __metadata("design:type", Object)
    ], CheckoutPage.prototype, "phone", void 0);
    CheckoutPage = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({
            selector: 'page-checkout',template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\checkout\checkout.html"*/'<ion-header>\n\n  <ion-navbar>\n    <ion-title>Checkout</ion-title>\n  </ion-navbar>\n\n</ion-header>\n\n\n<ion-content>\n    <ion-list *ngFor="let f of formval">\n      <form>\n      <ion-item-divider color="danger">Personal Details</ion-item-divider>\n\n      <ion-item> \n        <ion-label>Name</ion-label>\n        <ion-input type="text"  placeholder="{{f.name}}"></ion-input>\n      </ion-item>\n\n    \n\n      <ion-item>\n        <ion-label>Email</ion-label>\n        <ion-input readonly type="email"   placeholder="{{f.email}}"></ion-input>\n      </ion-item>\n\n      <ion-item>\n        <ion-label>Username</ion-label>\n        <ion-input readonly type="text"   placeholder="{{f.username}}"></ion-input>\n      </ion-item>\n\n      <ion-item-divider color="danger">Billing Details</ion-item-divider>\n\n      <ion-item>\n        <ion-label>Address Line 1</ion-label>\n        <ion-textarea type="text" maxlength="80" #address1></ion-textarea>\n      </ion-item>\n\n      <ion-item>\n        <ion-label>Address Line 2</ion-label>\n        <ion-textarea type="text" maxlength="80" #address2></ion-textarea>\n      </ion-item>\n\n      <ion-item>\n        <ion-label>Country</ion-label>\n      <ion-input type="text" #country></ion-input>    \n      </ion-item>\n\n      <ion-item>\n        <ion-label>State</ion-label>\n        <ion-input type="text" #state></ion-input>    \n      </ion-item>\n\n      <ion-item>\n        <ion-label>City</ion-label>\n        <ion-input type="text" #city></ion-input>        \n      </ion-item>\n\n      <ion-item>\n        <ion-label>Postal Code</ion-label>\n        <ion-input type="number" #postalcode></ion-input>        \n      </ion-item>\n\n      <ion-item>\n        <ion-label>Phone</ion-label>\n        <ion-input type="tel" #phone></ion-input>        \n      </ion-item>\n\n      \n\n    <ion-item-divider color="danger">Payment Details</ion-item-divider>\n\n      <ion-item>\n        <ion-label>Payment Method</ion-label>\n        <ion-select #paymentMethod>\n          <ion-option *ngFor="let p of paymentMethods" value="{{p.method_id}}">{{ p.method_title }}</ion-option>\n        </ion-select>\n      </ion-item>\n</form>\n    </ion-list>\n\n</ion-content>\n\n<ion-footer>\n  <button ion-button block color="danger" (click)="placeOrder()">Place Order</button>\n</ion-footer>'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\checkout\checkout.html"*/,
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */], __WEBPACK_IMPORTED_MODULE_4__angular_http__["b" /* Http */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */], __WEBPACK_IMPORTED_MODULE_2__ionic_storage__["b" /* Storage */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["a" /* AlertController */], __WEBPACK_IMPORTED_MODULE_3__providers_woocommerce_woocommerce__["a" /* WoocommerceProvider */]])
    ], CheckoutPage);
    return CheckoutPage;
}());

//# sourceMappingURL=checkout.js.map

/***/ }),

/***/ 194:
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncatched exception popping up in devtools
	return Promise.resolve().then(function() {
		throw new Error("Cannot find module '" + req + "'.");
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = 194;

/***/ }),

/***/ 235:
/***/ (function(module, exports, __webpack_require__) {

var map = {
	"../pages/checkout/checkout.module": [
		602,
		7
	],
	"../pages/home/home.module": [
		603,
		6
	],
	"../pages/login/login.module": [
		604,
		1
	],
	"../pages/menu/menu.module": [
		607,
		5
	],
	"../pages/product-by-category/product-by-category.module": [
		605,
		4
	],
	"../pages/product-details/product-details.module": [
		606,
		3
	],
	"../pages/search/search.module": [
		609,
		2
	],
	"../pages/signup/signup.module": [
		608,
		0
	]
};
function webpackAsyncContext(req) {
	var ids = map[req];
	if(!ids)
		return Promise.reject(new Error("Cannot find module '" + req + "'."));
	return __webpack_require__.e(ids[1]).then(function() {
		return __webpack_require__(ids[0]);
	});
};
webpackAsyncContext.keys = function webpackAsyncContextKeys() {
	return Object.keys(map);
};
webpackAsyncContext.id = 235;
module.exports = webpackAsyncContext;

/***/ }),

/***/ 340:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return NetworkEngineProvider; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_common_http__ = __webpack_require__(296);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_core__ = __webpack_require__(0);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


/*
  Generated class for the NetworkEngineProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
var NetworkEngineProvider = /** @class */ (function () {
    function NetworkEngineProvider(http) {
        this.http = http;
        console.log('Hello NetworkEngineProvider Provider');
    }
    NetworkEngineProvider.prototype.login12 = function (u, p) {
        var param = { username: u, password: p };
        var url = "http://192.168.225.39:8085/login.php";
        var request = this.http.post(url, param);
        return request.toPromise();
    };
    NetworkEngineProvider = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_1__angular_core__["A" /* Injectable */])(),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_0__angular_common_http__["a" /* HttpClient */]])
    ], NetworkEngineProvider);
    return NetworkEngineProvider;
}());

//# sourceMappingURL=network-engine.js.map

/***/ }),

/***/ 341:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return CartPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__ionic_storage__ = __webpack_require__(108);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__ = __webpack_require__(181);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__checkout_checkout__ = __webpack_require__(183);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






var CartPage = /** @class */ (function () {
    function CartPage(navCtrl, http, navParams, storage, viewCtrl, toastCtrl) {
        var _this = this;
        this.navCtrl = navCtrl;
        this.http = http;
        this.navParams = navParams;
        this.storage = storage;
        this.viewCtrl = viewCtrl;
        this.toastCtrl = toastCtrl;
        this.cartItems = [];
        this.showEmptyCartMessage = false;
        this.total = 0;
        this.storage.ready().then(function () {
            _this.storage.get("cart").then(function (res) {
                _this.cartItems = res;
                console.log();
                if (_this.cartItems.length > 0) {
                    _this.cartItems.forEach(function (item, index) {
                        _this.total = _this.total + (item.product.productprice * item.qty);
                    });
                }
                else {
                    _this.showEmptyCartMessage = true;
                }
            });
        });
    }
    CartPage.prototype.removeFromCart = function (item, i) {
        var _this = this;
        var price = item.product.productprice;
        var qty = item.qty;
        this.cartItems.splice(i, 1);
        this.storage.set("cart", this.cartItems).then(function () {
            _this.total = _this.total - (price * qty);
        });
        if (this.cartItems.length == 0) {
            this.showEmptyCartMessage = true;
        }
    };
    CartPage.prototype.closeModal = function () {
        this.viewCtrl.dismiss();
    };
    CartPage.prototype.checkout = function () {
        var _this = this;
        this.storage.get("userLoginInfo").then(function (data) {
            if (data != null) {
                var headers = new __WEBPACK_IMPORTED_MODULE_3__angular_http__["a" /* Headers */]();
                headers.append("Accept", 'application/json');
                headers.append('Content-Type', 'application/json');
                var options = new __WEBPACK_IMPORTED_MODULE_3__angular_http__["d" /* RequestOptions */]({ headers: headers });
                _this.http.post('http://192.168.225.39:8085/userid.php', JSON.stringify(data), options)
                    .map(function (res) { return res.json(); })
                    .subscribe(function (res) {
                    _this.userid = res;
                    _this.userid.forEach(function (item, index) {
                        _this.use = item.userid;
                        console.log(_this.use);
                    });
                    _this.navCtrl.push(__WEBPACK_IMPORTED_MODULE_5__checkout_checkout__["a" /* CheckoutPage */], { params1: _this.use });
                });
            }
            else {
            }
        });
        //this.navCtrl.push(CheckoutPage);
    };
    CartPage.prototype.changeQty = function (item, i, change) {
        var _this = this;
        var price = 0;
        var qty = 0;
        price = parseFloat(item.product.productprice);
        qty = item.qty;
        if (change < 0 && item.qty == 1) {
            return;
        }
        qty = qty + change;
        item.qty = qty;
        item.amount = qty * price;
        this.cartItems[i] = item;
        this.storage.set("cart", this.cartItems).then(function () {
            _this.toastCtrl.create({
                message: "Cart Updated.",
                duration: 2000,
                showCloseButton: true
            }).present();
        });
        this.total = (parseFloat(this.total.toString()) + (parseFloat(price.toString()) * change));
    };
    CartPage = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({
            selector: 'page-cart',template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\cart\cart.html"*/'<ion-header>\n\n  <ion-navbar>\n    <ion-title>Your Cart</ion-title>\n  </ion-navbar>\n\n</ion-header>\n\n\n<ion-content>\n\n  <ion-card>\n    <ion-grid>\n      <ion-row>\n        <ion-col>Your Cart Description</ion-col>\n      </ion-row>\n      <ion-row [hidden]="!showEmptyCartMessage">\n        <ion-col>There are no products in your cart!</ion-col>\n      </ion-row>\n    </ion-grid>\n  </ion-card>\n\n  <ion-card  *ngFor="let item of cartItems; let i = index">\n    <ion-item color="light">\n      <ion-thumbnail item-left>\n       \n         <img src="./assets/productimages/{{item.product.productimage}}" style="width: 60px !important; height: 60px !important;"/>\n      </ion-thumbnail>\n      <h2>{{ item.product.productname }}</h2>\n      <p>{{ item.qty }} x {{ item.product.productprice }}</p>\n    </ion-item>\n\n    <ion-item class="compact">\n       <ion-row no-padding>\n         <ion-col col-8>\n          <button ion-button icon-only clear color="danger" (click)="changeQty(item, i, -1)">\n            <ion-icon name="remove-circle"></ion-icon>\n          </button>\n          <button ion-button clear color="danger">{{ item.qty }}</button>\n          <button ion-button icon-only clear color="danger" (click)="changeQty(item, i, 1)">\n            <ion-icon name="add-circle"></ion-icon>\n          </button>\n         </ion-col>\n         <ion-row col-4 style="text-align: right;">\n          <button ion-button small outline color="danger" (click)="removeFromCart(item, i)" style="width: 64px;"> \n            Remove\n          </button>\n         </ion-row>\n       </ion-row>\n    </ion-item>\n  </ion-card>\n\n  <ion-grid>\n    <ion-card>\n      <ion-grid>\n        <ion-row>\n          <ion-col col-2>\n\n          </ion-col>\n          <ion-col col-4>\n            <b>\n              TOTAL\n            </b>\n          </ion-col>\n          <ion-col col-3>\n\n          </ion-col>\n          <ion-col col-3 style="text-align: right;">\n            &#8377;<b> {{ total }} </b>\n          </ion-col>\n        </ion-row>\n      </ion-grid>\n    </ion-card>\n  </ion-grid>\n\n</ion-content>\n\n<ion-footer>\n  <ion-toolbar>\n    <ion-grid>\n      <ion-row>\n        <ion-col>\n          <button ion-button color="danger" outline block (click)="closeModal()">Back</button>\n        </ion-col>\n        <ion-col>\n          <button ion-button color="danger" block (click)="checkout()">Checkout</button>\n        </ion-col>\n      </ion-row>\n    </ion-grid>\n  </ion-toolbar>\n</ion-footer>'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\cart\cart.html"*/,
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */], __WEBPACK_IMPORTED_MODULE_3__angular_http__["b" /* Http */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */], __WEBPACK_IMPORTED_MODULE_2__ionic_storage__["b" /* Storage */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["n" /* ViewController */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["m" /* ToastController */]])
    ], CartPage);
    return CartPage;
}());

//# sourceMappingURL=cart.js.map

/***/ }),

/***/ 342:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser_dynamic__ = __webpack_require__(343);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__app_module__ = __webpack_require__(363);


Object(__WEBPACK_IMPORTED_MODULE_0__angular_platform_browser_dynamic__["a" /* platformBrowserDynamic */])().bootstrapModule(__WEBPACK_IMPORTED_MODULE_1__app_module__["a" /* AppModule */]);
//# sourceMappingURL=main.js.map

/***/ }),

/***/ 363:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__ = __webpack_require__(51);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__app_component__ = __webpack_require__(593);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__pages_cart_cart__ = __webpack_require__(341);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__pages_checkout_checkout__ = __webpack_require__(183);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__angular_common_http__ = __webpack_require__(296);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8__ionic_native_status_bar__ = __webpack_require__(336);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_9__ionic_native_splash_screen__ = __webpack_require__(338);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_10__ionic_native_onesignal__ = __webpack_require__(339);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_11__ionic_storage__ = __webpack_require__(108);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_12__providers_woocommerce_woocommerce__ = __webpack_require__(182);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_13__providers_network_engine_network_engine__ = __webpack_require__(340);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};




// import { HomePage } from '../pages/home/home';
// import { MenuPage } from "../pages/menu/menu";
// import { ProductByCategoryPage } from "../pages/product-by-category/product-by-category";
// import { ProductDetailsPage } from "../pages/product-details/product-details";


// import { SignupPage } from "../pages/signup/signup";
// import { LoginPage } from "../pages/login/login";
// import { CheckoutPage } from "../pages/checkout/checkout";
// import { SearchPage } from "../pages/search/search";








var AppModule = /** @class */ (function () {
    function AppModule() {
    }
    AppModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_1__angular_core__["I" /* NgModule */])({
            declarations: [
                __WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* MyApp */],
                __WEBPACK_IMPORTED_MODULE_4__pages_cart_cart__["a" /* CartPage */],
                __WEBPACK_IMPORTED_MODULE_5__pages_checkout_checkout__["a" /* CheckoutPage */]
            ],
            imports: [
                __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__["a" /* BrowserModule */],
                __WEBPACK_IMPORTED_MODULE_7__angular_http__["c" /* HttpModule */],
                __WEBPACK_IMPORTED_MODULE_6__angular_common_http__["b" /* HttpClientModule */],
                __WEBPACK_IMPORTED_MODULE_2_ionic_angular__["d" /* IonicModule */].forRoot(__WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* MyApp */], {}, {
                    links: [
                        { loadChildren: '../pages/checkout/checkout.module#CheckoutPageModule', name: 'CheckoutPage', segment: 'checkout', priority: 'low', defaultHistory: [] },
                        { loadChildren: '../pages/home/home.module#HomePageModule', name: 'HomePage', segment: 'home', priority: 'low', defaultHistory: [] },
                        { loadChildren: '../pages/login/login.module#LoginPageModule', name: 'LoginPage', segment: 'login', priority: 'low', defaultHistory: [] },
                        { loadChildren: '../pages/product-by-category/product-by-category.module#ProductByCategoryPageModule', name: 'ProductByCategoryPage', segment: 'product-by-category', priority: 'low', defaultHistory: [] },
                        { loadChildren: '../pages/product-details/product-details.module#ProductDetailsPageModule', name: 'ProductDetailsPage', segment: 'product-details', priority: 'low', defaultHistory: [] },
                        { loadChildren: '../pages/menu/menu.module#MenuPageModule', name: 'MenuPage', segment: 'menu', priority: 'low', defaultHistory: [] },
                        { loadChildren: '../pages/signup/signup.module#SignupPageModule', name: 'SignupPage', segment: 'signup', priority: 'low', defaultHistory: [] },
                        { loadChildren: '../pages/search/search.module#SearchPageModule', name: 'SearchPage', segment: 'search', priority: 'low', defaultHistory: [] }
                    ]
                }),
                __WEBPACK_IMPORTED_MODULE_11__ionic_storage__["a" /* IonicStorageModule */].forRoot()
            ],
            bootstrap: [__WEBPACK_IMPORTED_MODULE_2_ionic_angular__["b" /* IonicApp */]],
            entryComponents: [
                __WEBPACK_IMPORTED_MODULE_3__app_component__["a" /* MyApp */],
                __WEBPACK_IMPORTED_MODULE_4__pages_cart_cart__["a" /* CartPage */],
                __WEBPACK_IMPORTED_MODULE_5__pages_checkout_checkout__["a" /* CheckoutPage */]
            ],
            providers: [
                __WEBPACK_IMPORTED_MODULE_8__ionic_native_status_bar__["a" /* StatusBar */],
                __WEBPACK_IMPORTED_MODULE_9__ionic_native_splash_screen__["a" /* SplashScreen */],
                __WEBPACK_IMPORTED_MODULE_10__ionic_native_onesignal__["a" /* OneSignal */],
                { provide: __WEBPACK_IMPORTED_MODULE_1__angular_core__["u" /* ErrorHandler */], useClass: __WEBPACK_IMPORTED_MODULE_2_ionic_angular__["c" /* IonicErrorHandler */] },
                __WEBPACK_IMPORTED_MODULE_12__providers_woocommerce_woocommerce__["a" /* WoocommerceProvider */],
                __WEBPACK_IMPORTED_MODULE_13__providers_network_engine_network_engine__["a" /* NetworkEngineProvider */]
            ]
        })
    ], AppModule);
    return AppModule;
}());

//# sourceMappingURL=app.module.js.map

/***/ }),

/***/ 404:
/***/ (function(module, exports) {

/* (ignored) */

/***/ }),

/***/ 406:
/***/ (function(module, exports) {

/* (ignored) */

/***/ }),

/***/ 438:
/***/ (function(module, exports) {

/* (ignored) */

/***/ }),

/***/ 439:
/***/ (function(module, exports) {

/* (ignored) */

/***/ }),

/***/ 506:
/***/ (function(module, exports) {

/* (ignored) */

/***/ }),

/***/ 593:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MyApp; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__ionic_native_status_bar__ = __webpack_require__(336);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__ionic_native_splash_screen__ = __webpack_require__(338);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__ionic_native_onesignal__ = __webpack_require__(339);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var MyApp = /** @class */ (function () {
    function MyApp(platform, statusBar, splashScreen, oneSignal) {
        this.platform = platform;
        this.statusBar = statusBar;
        this.splashScreen = splashScreen;
        this.oneSignal = oneSignal;
        this.rootPage = 'MenuPage';
        this.initializeApp();
    }
    MyApp.prototype.initializeApp = function () {
        var _this = this;
        this.platform.ready().then(function () {
            // Okay, so the platform is ready and our plugins are available.
            // Here you can do any higher level native things you might need.
            _this.statusBar.styleDefault();
            _this.splashScreen.hide();
            _this.oneSignal.startInit('758ab395-be7b-4bca-953a-5b45f6185fc4', '151234453636');
            _this.oneSignal.inFocusDisplaying(_this.oneSignal.OSInFocusDisplayOption.InAppAlert);
            _this.oneSignal.handleNotificationReceived().subscribe(function () {
                // do something when notification is received
            });
            _this.oneSignal.handleNotificationOpened().subscribe(function () {
                // do something when a notification is opened
            });
            _this.oneSignal.endInit();
        });
    };
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])(__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["h" /* Nav */]),
        __metadata("design:type", __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["h" /* Nav */])
    ], MyApp.prototype, "nav", void 0);
    MyApp = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\app\app.html"*/'\n\n<!-- Disable swipe-to-go-back because it\'s poor UX to combine STGB with side menus -->\n<ion-nav [root]="rootPage" #content swipeBackEnabled="false"></ion-nav>'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\app\app.html"*/
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["k" /* Platform */], __WEBPACK_IMPORTED_MODULE_2__ionic_native_status_bar__["a" /* StatusBar */], __WEBPACK_IMPORTED_MODULE_3__ionic_native_splash_screen__["a" /* SplashScreen */], __WEBPACK_IMPORTED_MODULE_4__ionic_native_onesignal__["a" /* OneSignal */]])
    ], MyApp);
    return MyApp;
}());

//# sourceMappingURL=app.component.js.map

/***/ })

},[342]);
//# sourceMappingURL=main.js.map