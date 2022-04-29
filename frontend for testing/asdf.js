function init(){
	
	document.getElementById("mybutton").addEventListener("click", asdf);
	
	
	function asdf(){
		
		var mypost = {
			id: 1,
			contents: document.getElementById("input").value,
			userid: 1,
			parent_post: 0
		};
		
		fetch("http://localhost:8080/post",{
			header:"admin",
			headers:{
				"content-type": "application/json",
			},
			method: "put",
			body: JSON.stringify(mypost)
		});
	}
}