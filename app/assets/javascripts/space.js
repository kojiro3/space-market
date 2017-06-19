$(function() {

  $('.user-list-button').on('click', function(e) {
    e.preventDefault();

    $('.space__info__detail__wrapper__body__text--button').toggleClass('button');
    $('.space__info__detail__wrapper__body--user').toggleClass('hidden');
  })
})
