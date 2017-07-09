$(function() {
  
  $("a.lists_link").on("click", function(e){
      e.preventDefault();
    $.ajax({
      method: "GET",
      url: this.href,
    }).done(function(data) {
      data.forEach(list => {
        let newList = new List(list)
        let listHtml = newList.formatIndex()
        $('#lists').append(listHtml)
      })
    })
  })

  $(document).on('click', ".list_link", (e) => {
      e.preventDefault()
      let id = $(e.target).attr('data-id') 
      $.get(`/lists/${id}.json`, function(data) {
        $.get(`/ratings/new`, function(data2) {
          $('#lists').html("")
          let newList = new List(data)
          let listHtml = newList.formatShow()
          let nextButton = newList.formatNext()
          $('#lists').append(listHtml)
          $('#comments').append(data2)
          $('#next').append(nextButton)
        })
      })
    })

    $(document).on('click', ".next-list", (e) => {
      e.preventDefault()
      let id = $(e.target).attr('data-id') 
      $.get(`/lists/${id}/next`, function(data) {
        $.get(`/ratings/new`, function(data2) {
          $('#lists').html("")
          $('#comments').html("")
          $('#next').html("")
            let newList = new List(data)
            let listHtml = newList.formatShow()
            let nextButton = newList.formatNext()
              $('#lists').append(listHtml)
              $('#comments').append(data2)
              $('#next').append(nextButton)
        })
      })
    })

    $(document).on('submit', ".new_rating", (e) => {
      e.preventDefault()
      $.ajax({
        type: "POST",
        url: "/ratings",
        data: {
          'authenticity_token': $("input[name='authenticity_token']").val(),
          'rating': {
            'rating': $("#rating_rating").val()
          }
        },
        success: function(response) {
          debugger
        }
      })
    })

  function List(list) {
    this.id = list.id
    this.title = list.title
  }

  List.prototype.formatIndex = function(){
    let listHtml = `
    <a href="/lists/${this.id}" class="list_link"><h3 data-id="${this.id}">${this.title}</h3></a>
    `
    return listHtml
  }

  List.prototype.formatShow = function(){
    let listHtml = `
      <h3>${this.title}</h3>
    `
    return listHtml
  }

  List.prototype.formatNext = function(){
    let nextButton = `
      <button class="next-list" data-id="${this.id}">Next</button>
    `
    return nextButton
  }

})


  



