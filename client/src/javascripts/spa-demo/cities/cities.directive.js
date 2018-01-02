(function() {
    'use strict';

    angular
        .module("spa-demo.cities")
        .directive("sdCities", CitiesDirective);
        //sd-foos

    CitiesDirective.$inject = ["spa-demo.APP_CONFIG"];

    /* @ngInject */
    function CitiesDirective(APP_CONFIG) {
        var directive = {
            templateUrl: APP_CONFIG.cities_html,
            replace: true,
            bindToController: true,
            controller: "spa-demo.cities.CitiesController",
            controllerAs: 'citiesVM',
            link: link,
            restrict: 'E',  // restric to only elements
            scope: {}
        };
        return directive;

        function link(scope, element, attrs) {
        }
    }

  
})();
