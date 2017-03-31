(function() {
  "use strict";

  angular.module("app").controller("dietCtrl", [ '$scope', '$http',function($scope, $http) {

    $scope.setup = function() {
      $http.get('/diets/diets.json').then(function(response){
        $scope.diets = response.data;
      });
    }

    $scope.dayEven = function(day) {
      if (day % 2 == 0) {
        $("." + day + "day").addClass('dark-div')
        return true
      } else {
        $("." + day + "day").addClass('light-div')
        return true
      }
    }

    $scope.anything = function(diet) {
      if ((diet.nuts_and_seeds + diet.greek_yogurt + diet.cheese + diet.almond_butter + diet.zoodles + diet.spaghetti_squash + diet.hummus_and_guac + diet.cottage_cheese + diet.fruit + diet.happy + diet.bean + diet.chocolate_bar) > 0) {
        return true
      } else {
        return false
      }
    }

    $scope.food = function(count) {
      if (count > 0) {
        return true
      } else {
        return false
      };
    }

    window.$scope = $scope;
  }]);

}());