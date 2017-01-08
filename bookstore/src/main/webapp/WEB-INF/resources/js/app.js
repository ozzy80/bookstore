var bookApp = angular.module('bookApp', ['ngResource']);

bookApp.directive('topTenBook', function(){
	// Runs during compile
	return {
		// scope: {}, // {} = isolate, true = child, false/undefined = no change
		templateUrl: 'resources/directives/top_ten_book.html',
		replace: true,
	};
});