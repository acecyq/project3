let specbutton = document.getElementsByClassName("hide");
let checkboxes = document.getElementById("checkboxes");
let hide = document.getElementsByClassName("hide")[0];
if (specbutton.length === 1) {
	hide.addEventListener("click", function() {
		if (checkboxes.style.display === "none") {
			checkboxes.style.display = "block";
		} else {
			checkboxes.style.display = "none";
		}
	});
}