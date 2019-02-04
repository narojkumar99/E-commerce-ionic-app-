webpackJsonp([0],{

/***/ 608:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "SignupPageModule", function() { return SignupPageModule; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__signup__ = __webpack_require__(611);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};



var SignupPageModule = /** @class */ (function () {
    function SignupPageModule() {
    }
    SignupPageModule = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["I" /* NgModule */])({
            declarations: [
                __WEBPACK_IMPORTED_MODULE_2__signup__["a" /* SignupPage */],
            ],
            imports: [
                __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["e" /* IonicPageModule */].forChild(__WEBPACK_IMPORTED_MODULE_2__signup__["a" /* SignupPage */]),
            ],
            exports: [
                __WEBPACK_IMPORTED_MODULE_2__signup__["a" /* SignupPage */]
            ]
        })
    ], SignupPageModule);
    return SignupPageModule;
}());

//# sourceMappingURL=signup.module.js.map

/***/ }),

/***/ 610:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return LoginPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__ionic_storage__ = __webpack_require__(108);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__providers_network_engine_network_engine__ = __webpack_require__(340);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__signup_signup__ = __webpack_require__(611);
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







var LoginPage = /** @class */ (function () {
    function LoginPage(navCtrl, navParams, http, toastCtrl, storage, alertCtrl, network) {
        this.navCtrl = navCtrl;
        this.navParams = navParams;
        this.http = http;
        this.toastCtrl = toastCtrl;
        this.storage = storage;
        this.alertCtrl = alertCtrl;
        this.network = network;
    }
    LoginPage.prototype.register = function () {
        this.navCtrl.push(__WEBPACK_IMPORTED_MODULE_5__signup_signup__["a" /* SignupPage */]);
    };
    LoginPage.prototype.loginuser = function (u, p) {
        var _this = this;
        u = u;
        //// check to confirm the username and password fields are filled
        /*if(this.username.value==""){
        
        let alert = this.alertCtrl.create({
        
        title:"ATTENTION",
        
        subTitle:"Username field is empty",
        
        buttons: ['OK']
        
        });
        
        alert.present();
        
        } else
        
        if(this.password.value==""){
        
        let alert = this.alertCtrl.create({
        
        title:"ATTENTION",
        
        subTitle:"Password field is empty",
        
        buttons: ['OK']
        
        });
        
        alert.present();
        
        }
        
        else
        
        {
        
        var headers = new Headers();
        
        headers.append("Accept", 'application/json');
        
        headers.append('Content-Type', 'application/json' );
        
        let options = new RequestOptions({ headers: headers });
        
        let data = {
        
        username: this.username.value,
        
        password: this.password.value
        
        };
        
        let loader = this.loading.create({
        
        content: 'Processing please wait…',
        
        });
        
        loader.present().then(() => {
        
        this.http.post('http://192.168.225.39:8085/login.php',data,options)
        
        
        .map(res => res.json())
        
        
        .subscribe(res => {
        
        console.log(res)
        
        loader.dismiss()
        
        
        if(res=="Your Login success"){
        
        let alert = this.alertCtrl.create({
        
        title:"CONGRATS",
        
        subTitle:(res),
        
        buttons: ['OK']
        
        });
        
        alert.present();
        
        }else
        
        {
        
        let alert = this.alertCtrl.create({
        
        title:"ERROR",
        
        subTitle:"Your Login Username or Password is invalid",
        
        buttons: ['OK']
        
        });
        
        alert.present();
        
        }
        
        });
        
        });
        
        }
        */
        this.network.login12(u, p).then(function (data) {
            console.log("received:" + JSON.stringify(data));
            _this.responseTxt = "" + JSON.stringify(data);
            if (data == "Your Login success") {
                var alert_1 = _this.alertCtrl.create({
                    title: "Done",
                    subTitle: ("Login success"),
                    buttons: ['OK']
                });
                alert_1.present();
            }
            _this.storage.set("userLoginInfo", u).then(function (data) {
            });
            ;
            if (data == "Your Login Email or Password is invalid") {
                var alert_2 = _this.alertCtrl.create({
                    title: "oops!!!",
                    subTitle: ("Login failed!!"),
                    buttons: ['OK']
                });
                alert_2.present();
            }
        });
    };
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])('username'),
        __metadata("design:type", Object)
    ], LoginPage.prototype, "username", void 0);
    __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["_8" /* ViewChild */])('password'),
        __metadata("design:type", Object)
    ], LoginPage.prototype, "password", void 0);
    LoginPage = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({
            selector: 'page-login',template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\login\login.html"*/'<ion-header>\n\n  <ion-navbar>\n    <ion-title>Login</ion-title>\n  </ion-navbar>\n\n</ion-header>\n\n\n<ion-content  class="background">\n  <ion-card style="margin: 0px; border: none; width: 100%;">\n    <img src="./assets/imgs/bas1.png" style="width: 70%; margin: auto; padding: 20px;">\n  </ion-card>\n<ion-card >\n\n<ion-card-header>\n  User-Login\n</ion-card-header>\n    <ion-card-content>\n      <ion-list no-line>\n        <ion-item>\n\n          <ion-input input type="text" placeholder="Username" [(ngModel)]="username"></ion-input>\n        </ion-item>\n          <ion-item>\n\n            <ion-input type="password" placeholder="Password" [(ngModel)]="password"></ion-input>\n          </ion-item>\n\n\n\n        \n        <a> Forget your login detail!<a>Get help signing in</a></a>\n        <button ion-button block outline color="light" (click)="loginuser(username,password)">LOGIN</button>\n        \n</ion-list>\n    </ion-card-content>\n\n</ion-card>\n\n</ion-content>\n'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\login\login.html"*/,
        }),
        __metadata("design:paramtypes", [__WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */], __WEBPACK_IMPORTED_MODULE_3__angular_http__["b" /* Http */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["m" /* ToastController */], __WEBPACK_IMPORTED_MODULE_2__ionic_storage__["b" /* Storage */], __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["a" /* AlertController */], __WEBPACK_IMPORTED_MODULE_4__providers_network_engine_network_engine__["a" /* NetworkEngineProvider */]])
    ], LoginPage);
    return LoginPage;
}());

//# sourceMappingURL=login.js.map

/***/ }),

/***/ 611:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SignupPage; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_ionic_angular__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_http__ = __webpack_require__(107);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_forms__ = __webpack_require__(31);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__login_login__ = __webpack_require__(610);
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






/**
 * Generated class for the SignupPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */
var SignupPage = /** @class */ (function () {
    //@ViewChild("name") name;
    //@ViewChild("username") username;
    //@ViewChild("email") email;
    //@ViewChild("password") password;
    //@ViewChild("confirmpassword") confirmpassword;
    function SignupPage(navCtrl, navParams, alertCtrl, http, loading, formBuilder) {
        this.navCtrl = navCtrl;
        this.navParams = navParams;
        this.alertCtrl = alertCtrl;
        this.http = http;
        this.loading = loading;
        this.formBuilder = formBuilder;
        this.myForm = this.formBuilder.group({
            name: ['', __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].compose([__WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].minLength(5), __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].pattern('[a-zA-Z ]*'), __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].required])],
            username: ['', __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].compose([__WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].maxLength(30), __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].pattern('[a-zA-Z0-9 ]+'), __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].required])],
            password: ['', __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].compose([__WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].required])],
            confirmpassword: ['', __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].compose([__WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].required])],
            email: ['', __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].compose([__WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].email, __WEBPACK_IMPORTED_MODULE_3__angular_forms__["f" /* Validators */].required])],
        });
    }
    SignupPage.prototype.onSubmit = function (myForm) {
        var _this = this;
        this.submitAttempt = true;
        if (!this.myForm.valid) {
        }
        else {
            var headers = new __WEBPACK_IMPORTED_MODULE_2__angular_http__["a" /* Headers */]();
            headers.append("Accept", 'application/json');
            headers.append('Content-Type', 'application/json');
            var options_1 = new __WEBPACK_IMPORTED_MODULE_2__angular_http__["d" /* RequestOptions */]({ headers: headers });
            var data_1 = {
                password: this.myForm.value.password,
                name: this.myForm.value.name,
                username: this.myForm.value.username,
                confirmpassword: this.myForm.value.confirmpassword,
                email: this.myForm.value.email
            };
            var loader_1 = this.loading.create({
                content: 'Processing please wait…',
            });
            loader_1.present().then(function () {
                _this.http.post('http://192.168.225.39:8085/register.php', JSON.stringify(data_1), options_1)
                    .map(function (res) { return res.json(); })
                    .subscribe(function (res) {
                    loader_1.dismiss();
                    if (res == "Registration successfull") {
                        var alert = _this.alertCtrl.create({
                            title: "whola,Done",
                            subTitle: ("Login to continue"),
                            buttons: ['OK']
                        });
                        _this.navCtrl.push(__WEBPACK_IMPORTED_MODULE_4__login_login__["a" /* LoginPage */]);
                        alert.present();
                    }
                    else {
                        var alert = _this.alertCtrl.create({
                            title: "oops!!",
                            subTitle: ("Registration unsuccesfull!!"),
                            buttons: ['OK']
                        });
                        alert.present();
                    }
                });
            });
        }
    };
    SignupPage.prototype.ionViewDidLoad = function () {
        console.log('ionViewDidLoad SignupPage');
    };
    SignupPage = __decorate([
        Object(__WEBPACK_IMPORTED_MODULE_0__angular_core__["m" /* Component */])({
            selector: 'page-signup',template:/*ion-inline-start:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\signup\signup.html"*/'\n\n\n\n  <ion-content  class="background">\n  \n\n  <img src="../assets/imgs/bas1.png"/>\n<ion-card>\n\n<ion-card-header>\n  SIGNUP\n</ion-card-header>\n    <ion-card-content>\n\n      <ion-list no-line>\n         <form [formGroup]="myForm" novalidate >\n        <ion-item>\n          \n          <ion-input input type="text" placeholder="Name" formControlName="name"></ion-input>\n        </ion-item>\n<ion-item no-lines *ngIf="( myForm.get(\'name\').hasError(\'minlength\') || myForm.get(\'name\').hasError(\'required\') ) && myForm.get(\'name\').touched">\n\n<div class="error" *ngIf="myForm.get(\'name\').hasError(\'required\') && myForm.get(\'name\').touched">\nName is required\n</div>\n<div class="error" *ngIf="myForm.get(\'name\').hasError(\'minlength\') && myForm.get(\'name\').touched">\nMaximum of 6 characters\n</div>\n</ion-item>\n\n        <ion-item>\n          \n          <ion-input input type="text" placeholder="Username" formControlName="username"></ion-input>\n        </ion-item>\n        <ion-item no-lines *ngIf="( myForm.get(\'username\').hasError(\'minlength\') || myForm.get(\'username\').hasError(\'required\') ) && myForm.get(\'username\').touched">\n\n<div class="error" *ngIf="myForm.get(\'username\').hasError(\'required\') && myForm.get(\'username\').touched">\nusername is required\n</div>\n<div class="error" *ngIf="myForm.get(\'username\').hasError(\'minlength\') && myForm.get(\'username\').touched">\nMinimum of 6 characters\n</div>\n</ion-item>\n          \n          <ion-item>\n\n            <ion-input type="email" placeholder="E-mail" formControlName="email"></ion-input>\n          </ion-item>\n\n           <ion-item no-lines *ngIf="( myForm.get(\'email\').hasError(\'email\') || myForm.get(\'email\').hasError(\'required\') ) && myForm.get(\'email\').touched">\n\n<div class="error" *ngIf="myForm.get(\'email\').hasError(\'required\') && myForm.get(\'username\').touched">\nemail is required\n</div>\n<div class="error" *ngIf="myForm.get(\'email\').hasError(\'email\') && myForm.get(\'email\').touched">\nEnter valid email\n</div>\n</ion-item>\n<ion-item>\n\n            <ion-input type="password" placeholder="Password" formControlName="password"></ion-input>\n          </ion-item>\n <ion-item no-lines *ngIf="( myForm.get(\'password\').hasError(\'required\') ) && myForm.get(\'password\').touched">\n\n<div class="error" *ngIf="myForm.get(\'password\').hasError(\'required\') && myForm.get(\'password\').touched">\npassword is required\n</div>\n\n</ion-item>\n\n          <ion-item>\n\n            <ion-input type="password" placeholder="confirmPassword" formControlName="confirmpassword"></ion-input>\n          </ion-item>\n          <ion-item no-lines *ngIf="( myForm.get(\'confirmpassword\').hasError(\'required\') ) && myForm.get(\'confirmpassword\').touched">\n\n<div class="error" *ngIf="myForm.get(\'confirmpassword\').hasError(\'required\') && myForm.get(\'confirmpassword\').touched">\npassword should match\n</div>\n\n</ion-item>\n\n\n</form>\n        \n        \n        <button ion-button block class="google" (click)="onSubmit(myForm)">SIGN-UP</button>\n</ion-list>\n    </ion-card-content>\n\n</ion-card>\n\n</ion-content>\n\n<style type="text/css">\n.error\n{\ncolor:red;\n}\n\n</style>\n'/*ion-inline-end:"C:\Users\bhatt9697\Desktop\ionicmobile\src\pages\signup\signup.html"*/,
        }),
        __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["i" /* NavController */]) === "function" && _a || Object, typeof (_b = typeof __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["j" /* NavParams */]) === "function" && _b || Object, typeof (_c = typeof __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["a" /* AlertController */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["a" /* AlertController */]) === "function" && _c || Object, typeof (_d = typeof __WEBPACK_IMPORTED_MODULE_2__angular_http__["b" /* Http */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_2__angular_http__["b" /* Http */]) === "function" && _d || Object, typeof (_e = typeof __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["f" /* LoadingController */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1_ionic_angular__["f" /* LoadingController */]) === "function" && _e || Object, typeof (_f = typeof __WEBPACK_IMPORTED_MODULE_3__angular_forms__["a" /* FormBuilder */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_3__angular_forms__["a" /* FormBuilder */]) === "function" && _f || Object])
    ], SignupPage);
    return SignupPage;
    var _a, _b, _c, _d, _e, _f;
}());

//# sourceMappingURL=signup.js.map

/***/ })

});
//# sourceMappingURL=0.js.map