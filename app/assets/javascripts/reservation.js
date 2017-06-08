$(function() {

  var times = [];

  $('.time-list-button').on('click', function(e) {
    e.preventDefault();

    $('.reservation__right__form__date__day__name').removeClass('dark');
    $('.reservation__right__form__date__day__name--day').removeClass('white');
    $('.reservation__right__form__date__day__name--price').removeClass('white');

    $('.reservation__right__form__date__time').removeClass('hidden');
    $(this).parent().addClass('dark');
    $(this).find('.reservation__right__form__date__day__name--day').addClass('white');
    $(this).find('.reservation__right__form__date__day__name--price').addClass('white');

    var start = $('.reservation__left__info__body').data('start');
    var finish = $('.reservation__left__info__body').data('finish');
    var year = $(this).data('year');
    var month = $(this).data('month');
    var day = $(this).data('day');

    for (var i = 0; i < 24; i++) {
      if (i < start || i >= finish) {
        var time = $('.time-' + i);
        time.addClass('time-select-button--unavailable');
        time.find('.reservation__right__form__date__time__list').addClass('reservation__right__form__date__time__list--unavailable');
        time.find('.fa').removeClass('fa-circle-o');
        time.find('.fa').addClass('fa-times');
        time.find('.reservation__right__form__date__time__list__right--price').remove();
        time.find('.reservation__right__form__date__time__list__right').append('<p class="reservation__right__form__date__time__list__right--price reservation__right__form__date__time__list__right--price--unavailable">不可');
      }
    }

    $('.time-select-button').on('click', function(e) {
      e.preventDefault();
      $(this).find('.fa').removeClass('fa-circle-o');
      $(this).find('.fa').addClass('fa-check');
      $(this).find('.reservation__right__form__date__time__list').addClass('green');
      $(this).find('.reservation__right__form__date__time__list__right--time').addClass('white');
      $(this).find('.reservation__right__form__date__time__list__right--price').addClass('white');
      var time = $(this).data('time');
      times.push(time);
    })

    $('.js-form').on('submit', function(e) {
      e.preventDefault();
      var space_id = $('.reservation__left__info__body').data('spaceid');
      var hour_price = $('.reservation__left__info__body').data('price');
      var start = Math.min.apply(null, times);
      var finish = Math.max.apply(null, times) + 1;
      var price = hour_price * ( finish - start );
      $.ajax({
        type: 'POST',
        url: '/spaces/' + space_id + '/reservations',
        data: {
          year: year,
          month: month,
          day: day,
          start: start,
          finish: finish,
          times: times,
          price: price,
          space_id: space_id
        },
        dataType: 'json',
      })
      .done(function(data) {
        $('.reservation__right__conf').removeClass('hidden');
        var start = data.start;
        var finish = data.finish;
        var times = start + ':00〜' + finish + ':00';
        $('.reservation__right__confirm__body__text--times').append(times);
        var price = '¥' + data.price;
        var pricetax = Math.round( data.price * 1.08 );
        var subprice = '(税込価格 ¥' + pricetax + ')';
        $('.reservation__right__confirm__body__text--price').append(price);
        $('.reservation__right__confirm__body__text--sub').append(subprice);
      })
      .fail(function() {
        alert('error');
        $(".reservation__right__form__submit__button").prop("disabled", false);
      })
    })
  })

})
