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

  function List(list) {
    this.id = list.id
    this.title = list.title
  }

  List.prototype.formatIndex = function(){
    let listHtml = `
    <a href="/lists/${this.id}" class="list_link"><h3>${this.title}</h3></a>
    `
    return listHtml
  }

})


  



