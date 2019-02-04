webpackJsonp([3],{

/***/ 606:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ProductDetailsPageModule", function() { return ProductDetailsPageModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__product_details__ = __webpack_require__(614);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};



var ProductDetailsPageModule = /** @class */ (function () {
    function ProductDetailsPageModule() {
    }
    ProductDetailsPageModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["I" /* NgModule */])({
            declarations: [
                __WEBPACK_IMPORTED_MODULE_2__product_details__["a" /* ProductDetailsPage */],
            ],
            imports: [
                __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["e" /* IonicPageModule */].forChild(__WEBPACK_IMPORTED_MODULE_2__product_details__["a" /* ProductDetailsPage */]),
            ],
            exports: [
                __WEBPACK_IMPORTED_MODULE_2__product_details__["a" /* ProductDetailsPage */]
            ]
        })
    ], ProductDetailsPageModule);
    return ProductDetailsPageModule;
}());

//# sourceMappingURL=product-details.module.js.map

/***/ }),

/***/ 614:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ProductDetailsPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__providers_woocommerce_woocommerce__ = __webpack_require__(182);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__cart_cart__ = __webpack_require__(341);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__ionic_storage__ = __webpack_require__(108);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6_rxjs_add_operator_map__ = __webpack_require__(181);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_6_rxjs_add_operator_map__);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};








var ProductDetailsPage = /** @class */ (function () {
    function ProductDetailsPage(navCtrl, http, navParams, storage, toastCtrl, modalCtrl, loading, WP) {
        this.navCtrl = navCtrl;
        this.http = http;
        this.navParams = navParams;
        this.storage = storage;
        this.toastCtrl = toastCtrl;
        this.modalCtrl = modalCtrl;
        this.loading = loading;
        this.WP = WP;
        this.reviews = [];
        this.product = this.navParams.get("product");
        this.pid = this.product.productid;
    }
    ProductDetailsPage.prototype.ionViewDidLoad = function () {
        var _this = this;
        var headers = new __WEBPACK_IMPORTED_MODULE_5__angular_http__["a" /* Headers */]();
        headers.append("Accept", 'application/json');
        headers.append('Content-Type', 'application/json');
        var options = new __WEBPACK_IMPORTED_MODULE_5__angular_http__["d" /* RequestOptions */]({ headers: headers });
        var loader = this.loading.create({
            content: 'please wait… products loading',
        });
        loader.present().then(function () {
            _this.http.post('http://192.168.225.39:8085/productdetail.php', JSON.stringify(_this.pid), options)
                .map(function (res) { return res.json(); })
                .subscribe(function (res) {
                _this.reviews = res;
                console.log(res);
            });
            _this.http.post('http://192.168.225.39:8085/review.php', JSON.stringify(_this.pid), options)
                .map(function (res) { return res.json(); })
                .subscribe(function (res) {
                loader.dismiss();
                _this.re = res;
                console.log(res);
            });
        });
    };
    ProductDetailsPage.prototype.addToCart = function (product) {
        var _this = this;
        this.storage.get("cart").then(function (res) {
            if (res == null || res.length == 0) {
                res = [];
                res.push({
                    "product": product.productname,
                    "qty": 1,
                    "amount": parseFloat(product.productprice)
                });
            }
            else {
                var added = 0;
                for (var i = 0; i < res.length; i++) {
                    if (product.productid == res[i].productid) {
                        var qty = res[i].qty;
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
                    });
                }
            }
            _this.storage.set("cart", res).then(function () {
                console.log("Cart Updated");
                console.log(res);
                _this.toastCtrl.create({
                    message: "Cart Updated",
                    duration: 3000
                }).present();
            });
        });
    };
    ProductDetailsPage.prototype.openCart = function () {
        this.modalCtrl.create(__WEBPACK_IMPORTED_MODULE_3__cart_cart__["a" /* CartPage */]).present();
    };
    ProductDetailsPage = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({
            selector: 'page-product-details',template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\product-details\product-details.html"*/'<ion-header>\n\n  <ion-navbar>\n    <ion-title>{{ product.productname }}</ion-title>\n  </ion-navbar>\n\n</ion-header>\n\n\n<ion-content>\n\n  <ion-fab right top edge (click)="openCart()">\n    <button ion-fab color="danger">\n      <ion-icon name="cart"></ion-icon>\n    </button>\n  </ion-fab>\n\n<ion-grid>\n  <ion-row>\n    <ion-card>\n       <ion-slides autoplay="3000" loop="true">\n      <ion-slide>\n        <img src="./assets/productimages/{{product.productimage}}" />\n      </ion-slide>\n      <ion-slide>\n        <img src="./assets/productimages/{{product.productimage2}}" />\n      </ion-slide>\n      <ion-slide>\n        <img src="./assets/productimages/{{product.productimage3}}" />\n      </ion-slide>\n    </ion-slides>\n    \n    \n      \n      \n  \n  </ion-card>\n  </ion-row>\n</ion-grid>\n\n<ion-card>\n    <ion-card-content>\n        <ion-card-title>\n          {{ product.productname }} &nbsp;\n        \n        </ion-card-title>\n        <p [innerHTML]="product.productdescription"></p>\n        <ion-row *ngFor="let review of reviews" >\n        <ion-col>  &#8377; <p>{{review.productprice}}</p></ion-col>\n        <ion-col><p><del>{{review.productpricebeforediscount}}</del></p></ion-col>\n         <ion-col><p>{{review.productavaiibility}}</p></ion-col>\n      </ion-row>\n        <button ion-button icon-left block outline color="danger" (click)="addToCart(product)">\n            <ion-icon name="basket"></ion-icon> Add to Cart\n          </button>\n      </ion-card-content>  \n</ion-card>\n\n\n\n\n<!-----<ion-card *ngIf="reviews.length > 0">------{{ review.name }}-------------- {{ review.review }}---------------------------------------*ngFor="let review of re"-------------->\n  <ion-card-content>\n    <ion-card-title>\n      Reviews\n    </ion-card-title>\n\n    <ion-grid>\n      <ion-row *ngFor="let review of re">\n        <ion-col col-4>\n          <b>{{review.name}}</b><br/>\n      <span *ngIf="review.quality >= 1">\n            <ion-icon style="color: #d4af37" small name="star"></ion-icon>\n          </span>\n          <span *ngIf="review.quality >= 2">\n            <ion-icon style="color: #d4af37" small name="star"></ion-icon>\n          </span>\n          <span *ngIf="review.quality >= 3">\n            <ion-icon style="color: #d4af37" small name="star"></ion-icon>\n          </span>\n          <span *ngIf="review.quality >= 4">\n            <ion-icon style="color: #d4af37" small name="star"></ion-icon>\n          </span>\n          <span *ngIf="review.quality >= 5">\n            <ion-icon style="color: #d4af37" small name="star"></ion-icon>\n          </span>\n        </ion-col>\n        <ion-col col-8>\n         {{review.review}} \n        </ion-col>\n      </ion-row>\n    </ion-grid>\n\n\n  </ion-card-content>\n\n\n</ion-content>\n'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\product-details\product-details.html"*/,
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */], __WEBPACK_IMPORTED_MODULE_5__angular_http__["b" /* Http */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */], __WEBPACK_IMPORTED_MODULE_4__ionic_storage__["b" /* Storage */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["m" /* ToastController */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["g" /* ModalController */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["f" /* LoadingController */], __WEBPACK_IMPORTED_MODULE_2__providers_woocommerce_woocommerce__["a" /* WoocommerceProvider */]])
    ], ProductDetailsPage);
    return ProductDetailsPage;
}());

//# sourceMappingURL=product-details.js.map

/***/ })

});
//# sourceMappingURL=3.js.map