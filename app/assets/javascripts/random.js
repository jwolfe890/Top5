$(function() {
  $("a.lists_link").on("click", function(e){
      e.preventDefault();

    $.ajax({
      method: "GET",
      url: this.href,
    }).done(function(data) {
      var list_info = data.map(function(item) {
        return $(`<ul>
            <h3>${item.title}</h3>
            <li>1.${item.number1}</li>
            <li>2.${item.number2}</li>
            <li>3.${item.number3}</li>
            <li>4.${item.number4}</li>
            <li>5.${item.number5}</li>
          <ul>`)
        })
      $('#lists').html(list_info);
    })
  })
})


