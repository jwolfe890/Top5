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
      $.ajax({
        method: "GET",
        url: `/lists/${id}.json`
      }).done(function(data) {
        $('#lists').html("")
        let newList = new List(data)
        let listHtml = newList.formatShow()
        $('#lists').append(listHtml)
      })
    })

    $(document).on('click', ".next-list", (e) => {
      e.preventDefault()
      let id = $(e.target).attr('data-id') 
      $.ajax({
        method: "GET",
        url: `/lists/${id}/next`
      }).done(function(data) {
        $('#lists').html("")
        let newList = new List(data)
        let listHtml = newList.formatShow()
        $('#lists').append(listHtml)
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
      <button class="next-list" data-id="${this.id}">Next</button>
    `
    return listHtml
  }

})


  



