
var tablinks = document.getElementsByClassName("tablinks");

for (var n = 0; n < tablinks.length; n += 1) {
  tablinks[n].addEventListener("click", function (event) {
    console.log(event)
    var teamName = event.srcElement.innerText.toLowerCase();
    openTeam(event, teamName)
  });
}

function openTeam(evt, teamNm) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tab-content");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    var tab = document.getElementById(teamNm)
    console.log(teamNm)
    console.log(tab)
    tab.style.display = "block";
    evt.currentTarget.className += " active";
}

export { openTeam };





