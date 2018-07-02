
var tablinks = document.getElementsByClassName("tablinks");
var columnTablinks = document.getElementsByClassName("column-tablinks");

for (var n = 0; n < tablinks.length; n += 1) {
  tablinks[n].addEventListener("click", function (event) {
    var teamName = event.srcElement.innerText.toLowerCase();
    openTeam(event, teamName)
  });
}

for (var n = 0; n < columnTablinks.length; n += 1) {
  columnTablinks[n].addEventListener("click", function (event) {
    var teamName = event.srcElement.innerText;
    console.log("1:")
    console.log(teamName)
    openColumn(event, teamName)
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
    tab.style.display = "block";
    evt.currentTarget.className += " active";
}

function openColumn(evt, teamNm) {
    // Declare all variables
    var i, columnTabcontent, columnTablinks;

    // Get all elements with class="tabcontent" and hide them
    columnTabcontent = document.getElementsByClassName("column-tab-content");
    for (i = 0; i < columnTabcontent.length; i++) {
      console.log("2:")
    console.log(columnTabcontent[i].style)
        columnTabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    columnTablinks = document.getElementsByClassName("column-tablinks");
    for (i = 0; i < columnTablinks.length; i++) {
        columnTablinks[i].className = columnTablinks[i].className.replace("active", "");
    }
    // Show the current tab, and add an "active" class to the button that opened the tab
    var tab = document.getElementById(teamNm)
    tab.style.display = "block";


    evt.currentTarget.className += " active";
}

export { openTeam };
export { openColumn };





