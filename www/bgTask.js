var utils = require('cordova/utils');
var exec = require('cordova/exec');
var cordova = require('cordova');
function bgTask(){

}
bgTask.prototype.begin = function(successCallback, errorCallback){
	exec(successCallback, errorCallback, "BackgroundTask", "begin");
}
module.exports = new bgTask();