// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function(){
  $('.carousel').carousel();

  // allow elements in a row to be the same height
  $('.equal-heights-1').equalHeights();
  $('.equal-heights-2').equalHeights();
  $('.equal-heights-3').equalHeights();

  // add datepicker popup
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd'
  });

});
