var utils = require('cordova/utils');
var exec = require('cordova/exec');
var cordova = require('cordova');
function LocalNotification(){

}
LocalNotification.prototype.noti = function(successCallback, errorCallback, alertBody, alertAction, userInfo){
	exec(successCallback, errorCallback, "LocalNotification", "noti", [alertBody, alertAction, userInfo]);
}
module.exports = new LocalNotification();