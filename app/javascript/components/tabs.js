function ClickTab() {
  var tab = document.querySelector('.tab');
  var content = document.querySelector('.tab-content')
  var currenttab = tab[0]
  currenttab.classList.add('active');
  console.log(tab)

  if (tab) {
    tab.forEach(function(element) {
      element.addEventListener('click', () => {
        element.classList.add('active');
        tab.forEach(function(element){
          console.log(element.classList)
          if (element.classList === "tab active") {
            element.classList.remove("active")
          }
        }
      content.innerHTML = `<%= render 'shared/table', currentteam: team %>`
      });
    }
  }
}

ClickTab()

// export { ClickTab };





