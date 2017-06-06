$(function() {

  $('.time-list-button').on('click', function(e) {
    e.preventDefault();

    $('.reservation__right__form__date__day__name').removeClass('dark')
    $('.reservation__right__form__date__day__name--day').removeClass('white')
    $('.reservation__right__form__date__day__name--price').removeClass('white')

    $('.reservation__right__form__date__time').removeClass('hidden');
    $(this).parent().addClass('dark')
    $(this).find('.reservation__right__form__date__day__name--day').addClass('white')
    $(this).find('.reservation__right__form__date__day__name--price').addClass('white')

    for (var i = 0; i < 8; i++) {
      var time = $('.time-' + i);
      time.addClass('time-select-button--unavailable');
      time.find('.reservation__right__form__date__time__list').addClass('reservation__right__form__date__time__list--unavailable');
      time.find('.fa').removeClass('fa-circle-o');
      time.find('.fa').addClass('fa-times');
      time.find('.reservation__right__form__date__time__list__right--price').remove();
      time.find('.reservation__right__form__date__time__list__right').append('<p class="reservation__right__form__date__time__list__right--price reservation__right__form__date__time__list__right--price--unavailable">不可');
    }
  })

    $('.time-select-button').on('click', function(e) {
    e.preventDefault();
    $(this).find('.fa').removeClass('fa-circle-o')
    $(this).find('.fa').addClass('fa-check')
    $(this).find('.reservation__right__form__date__time__list').addClass('green')
    $(this).find('.reservation__right__form__date__time__list__right--time').addClass('white')
    $(this).find('.reservation__right__form__date__time__list__right--price').addClass('white')

  })
})
