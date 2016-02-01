//Starts the Sammy app on page load
$(function() {
	routes.run("#/");
});

//Any app config variables go here
var config = {
	//holds the location of where our templates are
	TEMPLATES: "templates/"
};


//Routes go here
var routes = $.sammy("#content", function() {
	//Manage Students
	this.get("#/", function(context) {
		smgr.loadContent("student.html");
	});
});

//Application namespace
var smgr = smgr || {};

//Will show a big spinning circle in our main content namespace. To be used when Ajax data is being loaded.
smgr.showSpinner = function() {
	$('#content').html("<div id='spinner'><i class='fa fa-spinner fa-pulse fa-5x'></i></div>");
};

smgr.loadContent = function(templateName) {

	//Show spinning circle till all AJAX data has been loaded.
	smgr.showSpinner();

	//Will hold the html from template file.
	var templateHtml;

	$.get(config.TEMPLATES + templateName, function(html) {
		templateHtml = html;
	}, "html" )
	.done()
	;
};