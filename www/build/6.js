webpackJsonp([6],{

/***/ 603:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "HomePageModule", function() { return HomePageModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__home__ = __webpack_require__(612);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};



var HomePageModule = /** @class */ (function () {
    function HomePageModule() {
    }
    HomePageModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["I" /* NgModule */])({
            declarations: [
                __WEBPACK_IMPORTED_MODULE_2__home__["a" /* HomePage */],
            ],
            imports: [
                __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["e" /* IonicPageModule */].forChild(__WEBPACK_IMPORTED_MODULE_2__home__["a" /* HomePage */]),
            ],
            exports: [
                __WEBPACK_IMPORTED_MODULE_2__home__["a" /* HomePage */]
            ]
        })
    ], HomePageModule);
    return HomePageModule;
}());

//# sourceMappingURL=home.module.js.map

/***/ }),

/***/ 612:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return HomePage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_map__ = __webpack_require__(181);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_map__);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var HomePage = /** @class */ (function () {
    function HomePage(navCtrl, toastCtrl, http, loading) {
        this.navCtrl = navCtrl;
        this.toastCtrl = toastCtrl;
        this.http = http;
        this.loading = loading;
        this.searchQuery = "";
        this.page = 2;
        // this.LoadMoreProducts(null);
    }
    HomePage.prototype.ionViewDidLoad = function () {
        var _this = this;
        var headers = new __WEBPACK_IMPORTED_MODULE_1__angular_http__["a" /* Headers */]();
        headers.append("Accept", 'application/json');
        headers.append('Content-Type', 'application/json');
        var options = new __WEBPACK_IMPORTED_MODULE_1__angular_http__["d" /* RequestOptions */]({ headers: headers });
        var loader = this.loading.create({
            content: 'Processing please wait…',
        });
        loader.present().then(function () {
            _this.http.post('http://192.168.225.39:8085/allproducts.php', options)
                .map(function (res) { return res.json(); })
                .subscribe(function (res) {
                loader.dismiss();
                _this.products = res;
                console.log(res);
            });
        });
        setInterval(function () {
            if (_this.productSlides.getActiveIndex() == _this.productSlides.length() - 1) {
                _this.productSlides.slideTo(0);
            }
            _this.productSlides.slideNext();
        }, 3000);
    };
    /*LoadMoreProducts(event){
  
      if (event == null) {
        this.page = 2;
        this.moreproducts = [];
      }
      else {
        this.page ++;
      }
    
    }*/
    HomePage.prototype.openProductPage = function (products) {
        this.navCtrl.push('ProductDetailsPage', { "product": products });
    };
    HomePage.prototype.onSearch = function (event) {
        if (this.searchQuery.length > 0) {
            this.navCtrl.push('SearchPage', { "searchQuery": this.searchQuery });
        }
    };
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])('productSlides'),
        __metadata("design:type", __WEBPACK_IMPORTED_MODULE_2_ionic_angular__["l" /* Slides */])
    ], HomePage.prototype, "productSlides", void 0);
    HomePage = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({
            selector: 'page-home',template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\home\home.html"*/'<ion-header>\n  <ion-navbar color="danger">\n    <button ion-button menuToggle>\n      <ion-icon name="menu"></ion-icon>\n    </button>\n    <ion-title>Home</ion-title>\n  </ion-navbar>\n\n  <ion-toolbar color="danger">\n    <ion-searchbar [(ngModel)]="searchQuery" (search)="onSearch($event)"></ion-searchbar>\n  </ion-toolbar>\n\n</ion-header>\n\n\n\n<ion-content no-padding>\n\n<ion-grid>\n  <ion-row>\n    <ion-card>\n      <ion-slides loop="true" autoplay="3000" pager>\n        <ion-slide *ngFor="let number of [1,2,3,4]">\n          <img src="./assets/imgs/{{number}}.jpg">\n      </ion-slide>\n      </ion-slides>\n    </ion-card>\n  </ion-row>\n</ion-grid>\n\n<ion-grid>\n  <ion-row>\n    <ion-card>\n    <img src="./assets/imgs/banner.jpg">\n  </ion-card>\n  </ion-row>\n</ion-grid>\n\n<ion-grid>\n  <ion-row>\n    <ion-slides #productSlides>\n      <ion-slide *ngFor="let product of products">\n        <ion-card no-padding>\n          <img src="./assets/productimages/{{product.productimage1}}" width=250 height=250/>\n          <h1 padding center> {{ product.productname }} </h1>\n          <p padding center [innerHTML]="product.productdescription"></p>\n        </ion-card>\n      </ion-slide>\n    </ion-slides>\n  </ion-row>\n</ion-grid>\n\n<ion-list>\n  <ion-item *ngFor="let product of products" text-wrap (click)="openProductPage(product)">\n    <ion-thumbnail item-left>\n        <img src="./assets/productimages/{{product.productimage1}}" />\n    </ion-thumbnail>\n\n    <h2>{{ product.productname }}</h2>\n\n    <p>\n      <span [innerHTML]="product.productdescription.substr(0, 30) + \'...\'"></span>\n       &#8377; <span [innerHTML]="product.productprice"></span>      \n    </p>\n    \n   \n  \n  <button ion-button icon clear item-right>\n      <ion-icon name="arrow-round-forward"></ion-icon>\n  </button>\n</ion-item>  \n</ion-list>\n\n <ion-infinite-scroll >\n    <ion-infinite-scroll-content></ion-infinite-scroll-content>\n  </ion-infinite-scroll>\n\n\n</ion-content>\n'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\home\home.html"*/
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_2_ionic_angular__["i" /* NavController */], __WEBPACK_IMPORTED_MODULE_2_ionic_angular__["m" /* ToastController */], __WEBPACK_IMPORTED_MODULE_1__angular_http__["b" /* Http */], __WEBPACK_IMPORTED_MODULE_2_ionic_angular__["f" /* LoadingController */]])
    ], HomePage);
    return HomePage;
}());

//# sourceMappingURL=home.js.map

/***/ })

});
//# sourceMappingURL=6.js.map