webpackJsonp([5],{

/***/ 607:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "MenuPageModule", function() { return MenuPageModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__menu__ = __webpack_require__(615);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};



var MenuPageModule = /** @class */ (function () {
    function MenuPageModule() {
    }
    MenuPageModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["I" /* NgModule */])({
            declarations: [
                __WEBPACK_IMPORTED_MODULE_2__menu__["a" /* MenuPage */],
            ],
            imports: [
                __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["e" /* IonicPageModule */].forChild(__WEBPACK_IMPORTED_MODULE_2__menu__["a" /* MenuPage */]),
            ],
            exports: [
                __WEBPACK_IMPORTED_MODULE_2__menu__["a" /* MenuPage */]
            ]
        })
    ], MenuPageModule);
    return MenuPageModule;
}());

//# sourceMappingURL=menu.module.js.map

/***/ }),

/***/ 615:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return MenuPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__cart_cart__ = __webpack_require__(341);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__ = __webpack_require__(181);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__ionic_storage__ = __webpack_require__(108);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__providers_woocommerce_woocommerce__ = __webpack_require__(182);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};







var MenuPage = /** @class */ (function () {
    function MenuPage(navCtrl, navParams, http, storage, modalCtrl, WP) {
        this.navCtrl = navCtrl;
        this.navParams = navParams;
        this.http = http;
        this.storage = storage;
        this.modalCtrl = modalCtrl;
        this.WP = WP;
        this.homePage = 'HomePage';
        this.categories = [];
        this.user = {};
    }
    MenuPage.prototype.ionViewDidLoad = function () {
        var _this = this;
        var headers = new __WEBPACK_IMPORTED_MODULE_3__angular_http__["a" /* Headers */]();
        headers.append("Accept", 'application/json');
        headers.append('Content-Type', 'application/json');
        var options = new __WEBPACK_IMPORTED_MODULE_3__angular_http__["d" /* RequestOptions */]({ headers: headers });
        this.http.post('http://192.168.225.39:8085/categories.php', options)
            .map(function (res) { return res.json(); })
            .subscribe(function (res) {
            console.log(res);
            var temp = res;
            for (var i = 0; i < temp.length; i++) {
                if (temp[i].categoryname == "Books") {
                    temp[i].icon = "book";
                }
                if (temp[i].categoryname == "Grocery") {
                    temp[i].icon = "basket";
                }
                if (temp[i].categoryname == "Furniture") {
                    temp[i].icon = "home";
                }
                if (temp[i].categoryname == "Fashion") {
                    temp[i].icon = "shirt";
                }
                if (temp[i].categoryname == "Electronics") {
                    temp[i].icon = "desktop";
                }
                console.log(temp[i]);
                _this.categories.push(temp[i]);
            }
        });
        this.storage.ready().then(function () {
            _this.storage.get("userLoginInfo").then(function (userLoginInfo) {
                if (userLoginInfo != null) {
                    console.log("User logged in...");
                    _this.user = userLoginInfo;
                    console.log(_this.user);
                    _this.loggedIn = true;
                }
                else {
                    console.log("No user found.");
                    _this.user = {};
                    _this.loggedIn = false;
                }
            });
        });
    };
    MenuPage.prototype.openCategoryPage = function (category) {
        this.childNavCtrl.setRoot('ProductByCategoryPage', { "category": category });
    };
    MenuPage.prototype.openPage = function (pageName) {
        var _this = this;
        if (pageName == "signup") {
            this.navCtrl.push('SignupPage');
        }
        if (pageName == "login") {
            this.navCtrl.push('LoginPage');
        }
        if (pageName == "logout") {
            this.storage.remove("userLoginInfo").then(function () {
                _this.user = {};
                _this.loggedIn = false;
            });
        }
        if (pageName == "cart") {
            var modal = this.modalCtrl.create(__WEBPACK_IMPORTED_MODULE_2__cart_cart__["a" /* CartPage */]);
            modal.present();
        }
    };
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])('content'),
        __metadata("design:type", __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */])
    ], MenuPage.prototype, "childNavCtrl", void 0);
    MenuPage = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({
            selector: 'page-menu',template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\menu\menu.html"*/'<ion-menu [content]="content">\n  <ion-header>\n    <ion-toolbar>\n      <ion-title  >Menu</ion-title>\n    </ion-toolbar>\n  </ion-header>\n\n  <ion-content class="card-background-page">\n\n    <ion-card>\n      <img src="./assets/imgs/shopping.jpg">\n      <div class="card-title">SHOPIFY</div>\n      <div class="card-subtitle">Keep Shopping!</div>\n    </ion-card>\n\n    <ion-list>\n      <ion-item *ngFor="let category of categories" text-wrap (click)="openCategoryPage(category)" menuClose>\n        <ion-icon [name]="category.icon" item-left large></ion-icon>\n        <h2>\n          {{ category.categoryname }}\n        </h2>\n       \n      </ion-item>\n\n      <ion-item-divider color="danger">Account</ion-item-divider>\n      <ion-item (click)="openPage(\'signup\')" menuClose *ngIf="!loggedIn">\n        <ion-icon name="md-clipboard" item-left large></ion-icon>\n        <h2>\n          Sign Up\n        </h2>\n        <p>\n          For a new account\n        </p>\n      </ion-item>\n\n      <ion-item (click)="openPage(\'login\')" menuClose *ngIf="!loggedIn">\n        <ion-icon name="log-in" item-left large></ion-icon>\n        <h2>\n          Login\n        </h2>\n        <p>\n          Using email and password\n        </p>\n      </ion-item>\n\n      <ion-item *ngIf="loggedIn" menuClose>\n        <ion-icon name="contact" item-left large></ion-icon>\n        <h2>{{ this.user}}</h2>\n        <p>Welcome</p>\n      </ion-item>\n\n      <ion-item *ngIf="loggedIn" (click)="openPage(\'cart\')" menuClose>\n        <ion-icon name="cart" item-left large></ion-icon>\n        <h2>Your Cart</h2>\n        <p>Check items in your cart</p>\n      </ion-item>\n\n      <ion-item *ngIf="loggedIn" (click)="openPage(\'logout\')" menuClose>\n        <ion-icon name="log-out" item-left large></ion-icon>\n        <h2>Logout</h2>\n        <p>of your Account</p>\n      </ion-item>\n\n    </ion-list>\n  </ion-content>\n\n</ion-menu>\n\n<ion-nav #content [root]="homePage"></ion-nav>\n'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\menu\menu.html"*/,
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */], __WEBPACK_IMPORTED_MODULE_3__angular_http__["b" /* Http */], __WEBPACK_IMPORTED_MODULE_5__ionic_storage__["b" /* Storage */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["g" /* ModalController */], __WEBPACK_IMPORTED_MODULE_6__providers_woocommerce_woocommerce__["a" /* WoocommerceProvider */]])
    ], MenuPage);
    return MenuPage;
}());

//# sourceMappingURL=menu.js.map

/***/ })

});
//# sourceMappingURL=5.js.map