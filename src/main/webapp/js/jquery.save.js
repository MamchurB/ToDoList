$(function() {
	$("#submitUserForm").submit(function(e) {
		console.log("submitUserForm");
		e.preventDefault();
		var frm = $("#submitUserForm");
		var data = {};
		console.log("submitUserForm");
		$.each(this, function(i, v){
			var input = $(v);
			data[input.attr("name")] = input.val();
			delete data["undefined"];
		});
		saveRequestedData(frm, data, "user");
	});

});
$(function() {
	$("#submitAddTask").submit(function(e) {
		e.preventDefault();
		var frm = $("#submitAddTask");
		var data = {};
		$.each(this, function(i, v){
			var input = $(v);
			data[input.attr("name")] = input.val();
			delete data["undefined"];
		});

		saveRequestedData(frm, data, "task");
	});
});
$(function() {
	$("#submitTaskForm").submit(function(e) {
		e.preventDefault();
		var frm = $("#submitTaskForm");
		var data = {};
		$.each(this, function(i, v){
			var input = $(v);
			data[input.attr("name")] = input.val();
			delete data["undefined"];
		});
		saveRequestedData(frm, data, "task");
	});

});

$(function() {
	$("#submitSubTaskForm").submit(function(e) {
		e.preventDefault();
		var frm = $("#submitTaskForm");
		var data = {};
		$.each(this, function(i, v){
			var input = $(v);
			data[input.attr("name")] = input.val();
			delete data["undefined"];
		});
		saveRequestedData(frm, data, "task");
	});

});
$(function() {
	$("#submitEditTask").submit(function(e) {
		e.preventDefault();
		var frm = $("#submitEditTask");
		var data = {};
		$.each(this, function(i, v){
			var input = $(v);
			data[input.attr("name")] = input.val();
			console.log(data[input.attr("name")]);
			delete data["undefined"];
		});
		saveRequestedData(frm, data, "task");
	});

});
$(function() {
	$("#checkboxSubmit").submit(function(e) {
		e.preventDefault();
		var frm = $("#checkboxSubmit");
		var data = {};
		$.each(this, function(i, v){
			var input = $(v);
			data[input.attr("name")] = input.val();
			delete data["undefined"];
		});
		saveRequestedData(frm, data, "task");
	});

});

function saveRequestedData(frm, data, type) {
	console.log(frm.attr("action"));
	$.ajax({
		contentType:"application/json; charset=utf-8",
		type:frm.attr("method"),
		url:frm.attr("action"),
		dataType:'json',
		data:JSON.stringify(data),
		success:function(data) {
			window.location.reload(true);
		}
	});
}