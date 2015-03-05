angular.module('stocks').controller('NavigationController', [ '$scope', '$location',
  ($scope, $location)->

    $scope.navigateTo = (path) ->
      $location.path(path)

])
