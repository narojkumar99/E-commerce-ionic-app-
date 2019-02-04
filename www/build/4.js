webpackJsonp([4],{

/***/ 605:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ProductByCategoryPageModule", function() { return ProductByCategoryPageModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__product_by_category__ = __webpack_require__(613);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};



var ProductByCategoryPageModule = /** @class */ (function () {
    function ProductByCategoryPageModule() {
    }
    ProductByCategoryPageModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["I" /* NgModule */])({
            declarations: [
                __WEBPACK_IMPORTED_MODULE_2__product_by_category__["a" /* ProductByCategoryPage */],
            ],
            imports: [
                __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["e" /* IonicPageModule */].forChild(__WEBPACK_IMPORTED_MODULE_2__product_by_category__["a" /* ProductByCategoryPage */]),
            ],
            exports: [
                __WEBPACK_IMPORTED_MODULE_2__product_by_category__["a" /* ProductByCategoryPage */]
            ]
        })
    ], ProductByCategoryPageModule);
    return ProductByCategoryPageModule;
}());

//# sourceMappingURL=product-by-category.module.js.map

/***/ }),

/***/ 613:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ProductByCategoryPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__providers_woocommerce_woocommerce__ = __webpack_require__(182);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__ = __webpack_require__(181);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






// import { ProductDetailsPage } from "../product-details/product-details";
var ProductByCategoryPage = /** @class */ (function () {
    function ProductByCategoryPage(navCtrl, http, navParams, toastCtrl, loading, WP) {
        this.navCtrl = navCtrl;
        this.http = http;
        this.navParams = navParams;
        this.toastCtrl = toastCtrl;
        this.loading = loading;
        this.WP = WP;
        this.page = 1;
        this.category = this.navParams.get("category");
        this.cname = this.category.categoryname;
    }
    ProductByCategoryPage.prototype.ionViewDidLoad = function () {
        var _this = this;
        var headers = new __WEBPACK_IMPORTED_MODULE_3__angular_http__["a" /* Headers */]();
        headers.append("Accept", 'application/json');
        headers.append('Content-Type', 'application/json');
        var options = new __WEBPACK_IMPORTED_MODULE_3__angular_http__["d" /* RequestOptions */]({ headers: headers });
        var loader = this.loading.create({
            content: 'please wait… products loading',
        });
        loader.present().then(function () {
            _this.http.post('http://192.168.225.39:8085/productbycategory.php', JSON.stringify(_this.cname), options)
                .map(function (res) { return res.json(); })
                .subscribe(function (res) {
                loader.dismiss();
                _this.products = res;
                console.log(res);
            });
        });
    };
    ProductByCategoryPage.prototype.openProductPage = function (product) {
        this.navCtrl.push('ProductDetailsPage', { "product": product });
    };
    ProductByCategoryPage = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({
            selector: 'page-product-by-category',template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\product-by-category\product-by-category.html"*/'<ion-header>\n\n  <ion-navbar>\n    <ion-buttons left>\n      <button color="danger" ion-button icon menuToggle>\n        <ion-icon name="menu"></ion-icon>\n      </button>\n    </ion-buttons>\n    <ion-title>Product By Category</ion-title>\n  </ion-navbar>\n\n</ion-header>\n\n\n<ion-content>\n    <ion-list>\n        <ion-item *ngFor="let product of products" text-wrap (click)="openProductPage(product)">\n          <ion-thumbnail item-left>\n             <img src="./assets/productimages/{{product.productimage}}" />\n          </ion-thumbnail>\n      \n          <h2>{{ product.productname }}</h2>\n      \n          <p>\n            <span [innerHTML]="product.productdescription.substr(0, 30) + \'...\'"></span>\n           &#8377; <span [innerHTML]="product.productprice"></span>     \n          </p>\n      \n          <button ion-button icon clear item-right>\n              <ion-icon name="arrow-round-forward"></ion-icon>\n          </button>\n        </ion-item>\n      </ion-list>\n\n      <ion-infinite-scroll>\n          <ion-infinite-scroll-content></ion-infinite-scroll-content>\n        </ion-infinite-scroll>\n</ion-content>\n'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\product-by-category\product-by-category.html"*/,
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */], __WEBPACK_IMPORTED_MODULE_3__angular_http__["b" /* Http */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["m" /* ToastController */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["f" /* LoadingController */], __WEBPACK_IMPORTED_MODULE_2__providers_woocommerce_woocommerce__["a" /* WoocommerceProvider */]])
    ], ProductByCategoryPage);
    return ProductByCategoryPage;
}());

//# sourceMappingURL=product-by-category.js.map

/***/ })

});
//# sourceMappingURL=4.js.map