import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

/*
  Generated class for the NetworkEngineProvider provider.

  See https://angular.io/guide/dependency-injection for more info on providers
  and Angular DI.
*/
@Injectable()
export class NetworkEngineProvider {

  constructor(public http: HttpClient) {
    console.log('Hello NetworkEngineProvider Provider');
  }





login12(u,p) : Promise<any>{
let param ={username: u,password: p};

	let url="http://192.168.225.39:8085/login.php";
	let request = this.http.post(url,param);

	return request.toPromise();


}



}
