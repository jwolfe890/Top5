$(function() {

  var list_id = undefined
  
  $(document).on('click', "a.lists_link", (e) => {
    e.preventDefault();
    $.ajax({
      method: "GET",
      url: '/lists',
    }).done(function(data) {
      $('#lists').html("")
      $('#average_rating').html("")
      $('#next').html("")
      data.forEach(list => {
        let newList = new List(list)
        let listHtml = newList.formatIndex()
        $('#lists').append(listHtml)
      })
    })
  })

  $(document).on('click', ".list_link", (e) => {
      e.preventDefault()
      list_id = $(e.target).attr('data-id') 
      let id = $(e.target).attr('data-id') 
      $.get(`/lists/${id}.json`, function(data) {
        $.get(`/ratings/new`, function(data2) {
          $('#lists').html("")
          $('#average_rating').html("")
          let newList = new List(data)
          let listHtml = newList.formatShow()
          let nextButton = newList.formatNext()
          let listTopics = newList.formatTopics()
            $('#lists').append(listHtml)
            $('#average_rating').append(data2)
            $('#next').append(nextButton)
            $('#lists').append("<p>Topics:<p>")
            $('#lists').append(listTopics)
        })
      })
    })

    $(document).on('click', ".next-list", (e) => {
      e.preventDefault()
      list_id = $(e.target).attr('data-id')
      let id = $(e.target).attr('data-id') 
      $.get(`/lists/${id}/next`, function(data) {
        $.get(`/ratings/new`, function(data2) {
          $('#lists').html("")
          $('#average_rating').html("")
          $('#next').html("")
            let newList = new List(data)
            let listHtml = newList.formatShow()
            let nextButton = newList.formatNext()
            let listTopics = newList.formatTopics()
              $('#lists').append(listHtml)
              $('#average_rating').append(data2)
              $('#next').append(nextButton)
              $('#lists').append("<p>Topics:<p>")
              $('#lists').append(listTopics)
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
            'rating': $("#rating_rating").val(),
            'list_id': list_id
          }
        },
        success: function(response) {
          response
        }
      })
    })

  function List(list) {
    this.topics = list.topics
    this.id = list.id
    this.title = list.title
    this.average_rating = list.average
    this.number1 = list.number1
    this.number2 = list.number2
    this.number3 = list.number3
    this.number4 = list.number4
    this.number5 = list.number5
  }

  List.prototype.formatIndex = function(){
    let listHtml = `
    <a href="/lists/${this.id}" class="list_link"><h3 data-id="${this.id}">${this.title}</h3></a>
    `
    return listHtml
  }

  List.prototype.formatTopics = function() {
     var list = this.topics.map(function(tp) {
      return $(
        `
        <div>${tp.name}</div>
        `
      )
    })
      return list
  }

  List.prototype.formatShow = function(){
    let listHtml = `
      <h3>${this.title}</h3>
        1. ${this.number1}<br>
        2. ${this.number2}<br> 
        3. ${this.number3}<br> 
        4. ${this.number4}<br> 
        5. ${this.number5}<br>
        <br>
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

var palindrome = "level"
var palindrome2 = "levelEND"
var array = []

function palindrome(palindrome2) { 

  for (i = 0; i < palindrome2.length; i ++) {
    array.push(palindrome[i])
  }

  return array

}


  



