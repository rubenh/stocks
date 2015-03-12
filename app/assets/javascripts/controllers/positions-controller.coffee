angular.module('stocks').controller('PositionsController', [ '$scope', 'Position',
  ($scope, Position) ->

    $scope.reload = ->
      $scope.positions = Position.index()

    $scope.reload()

    $scope.createNewPosition =  ->
      $scope.newPosition = new Position()

    $scope.cancelNewPosition =  ->
      $scope.newPosition = undefined

    $scope.savePosition = (form) ->
      Position.create $scope.newPosition, (->
        $scope.reload()
        $scope.cancelNewPosition()), (response) ->
          $scope.reload()

    $scope.hasError = (key, form) ->
      return form[key].$invalid && form[key].$dirty

])
