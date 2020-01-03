function changeURL(node) {


	var url = $(node).attr("title");

	$(node).attr("title",(url+"?handle="+$("#user-name-label").html()));


	$("#myiframe").attr("src",$(node).attr("title"));




	$(node).attr("title",url);

}