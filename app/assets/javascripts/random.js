$(function() {
  
  $("a.lists_link").on("click", function(e){
    e.preventDefault()
    fetch(this.href)
      .then(res => res.json())
      .then(data => console.log(data))
    debugger

  })

})


